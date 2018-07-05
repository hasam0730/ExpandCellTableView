
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var catalogCltv: UICollectionView!
    @IBOutlet weak var catalogTbv: UITableView!
    
    enum ServiceCatalogMode: Int {
        case airConditional = 0
        case electrical
        case handyman
        case plumbing
    }
    
    enum HeightTbvRow: CGFloat {
        case header = 50.0
        case row = 45.0
    }
    
    var previousIndexPath: IndexPath = IndexPath(item: 0, section: 0)
    var tempedDataList: [ServiceCategory] = data
    var catalogsGroupsList: [ServiceGroup]!
    var previousExpandedIndex: Int?
    var groupIndex: Int = 0 {
        didSet {
            catalogTbv.reloadData()
        }
    }
    var previousSelectedIndex: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        layoutCatalogCell(at: previousIndexPath, in: catalogCltv, isSelected: true)
    }
    
    //MARK: setup tableview
    private func setupTableView() {
        catalogTbv.dataSource = self
        catalogTbv.delegate = self
        catalogTbv.backgroundColor = .white
        
        catalogTbv.rowHeight = UITableViewAutomaticDimension
        catalogTbv.estimatedRowHeight = 160
        
        catalogTbv.showsVerticalScrollIndicator = false
        catalogTbv.separatorStyle = .none
        catalogTbv.tableFooterView = UIView()
        
        registerTbvXib()
    }
    
    private func registerTbvXib() {
        catalogTbv.registerXibFile(ServiceCatalogItemCell.self)
    }
    
    private func setupCollectionView() {
        catalogCltv.dataSource = self
        catalogCltv.delegate = self
        
        registerCltv()
    }
    
    private func registerCltv() {
        catalogCltv.registerXibFile(CatalogTypeCell.self)
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    private func layoutCatalogCell(at indexpath: IndexPath, in collectionView: UICollectionView, isSelected: Bool) {
        let cell = collectionView.cell(at: indexpath, type: CatalogTypeCell.self)
        cell.isPicked = isSelected
    }
    
    func didRequestServiceCatalogData(data: [ServiceCategory]) {
        tempedDataList = data
    }
    
    var previousFocusedHeaderViewIndex: Int?
    
    func resetExpandCell(at index: Int) {
        if previousExpandedIndex == nil {
            previousExpandedIndex = 0
        } else {
            previousExpandedIndex = index
        }
        
        let itemsList: [ServiceGroup]? = tempedDataList[previousExpandedIndex!].serviceGroupList?.map({
            var newItem = $0
            newItem.expanded = false
            return newItem
        })
        
        tempedDataList[previousExpandedIndex!].serviceGroupList = itemsList
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempedDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(CatalogTypeCell.self, for: indexPath)
        cell.catalog = tempedDataList[indexPath.row]
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: catalogCltv.bounds.size.width, height: catalogCltv.bounds.size.width-20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        layoutCatalogCell(at: previousIndexPath, in: catalogCltv, isSelected: false)
        
        previousIndexPath = indexPath
        groupIndex = indexPath.item
        
        layoutCatalogCell(at: previousIndexPath, in: catalogCltv, isSelected: true)
        
        resetExpandCell(at: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        resetExpandCell(at: indexPath.item)
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tempedDataList[groupIndex].serviceGroupList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempedDataList[groupIndex].serviceGroupList?[section].serviceItem?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(ServiceCatalogItemCell.self, for: indexPath)
        cell.config(with: tempedDataList[groupIndex].serviceGroupList?[indexPath.section].serviceItem?[indexPath.row] ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = ExpandableHeaderView()
        let title = tempedDataList[groupIndex].serviceGroupList?[section].groupTitlte
        viewHeader.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: catalogTbv.frame.width, height: 50))
        viewHeader.customInit(title: title!, iconName: "", section: section, delegate: self)
        return viewHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return HeightTbvRow.header.rawValue
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tempedDataList[groupIndex].serviceGroupList![indexPath.section].expanded == true {
            return HeightTbvRow.row.rawValue
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension ViewController: ExpandableHeaderViewDelegate {
    func toggleSection(section: Int) {
        
        if let uwrIndex = previousSelectedIndex {
            let currv = catalogTbv.headerView(forSection: section) as! ExpandableHeaderView
            let previousv = catalogTbv.headerView(forSection: uwrIndex) as? ExpandableHeaderView
            if uwrIndex != section {
                if currv.imgIcon.transform == .identity {
                    currv.imgIcon.transform = CGAffineTransform(rotationAngle: .pi)
                }
                previousv?.imgIcon.transform = .identity
            }
        }
        previousSelectedIndex = section
        
        catalogTbv.beginUpdates()
        
        // Hide rows of another sections
        for i in 0 ..< tempedDataList[groupIndex].serviceGroupList!.count where section != i {
            let isExpanded = tempedDataList[groupIndex].serviceGroupList![i].expanded
            if isExpanded == true {
                tempedDataList[groupIndex].serviceGroupList![i].expanded = false
                
                for j in 0 ..< tempedDataList[groupIndex].serviceGroupList!.count {
                    catalogTbv.reloadRows(at: [IndexPath(row: j, section: i)], with: .automatic)
                }
            }
        }
        
        // Expand selected section
        let isExpanded = tempedDataList[groupIndex].serviceGroupList![section].expanded
        
        tempedDataList[groupIndex].serviceGroupList?[section].expanded = !isExpanded!
        
        for i in 0 ..< tempedDataList[groupIndex].serviceGroupList!.count {
            catalogTbv.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        catalogTbv.endUpdates()
    }
}
