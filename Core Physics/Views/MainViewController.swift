//
//  MainViewController.swift
//
//  Created by Jon Kent on 11/12/15.
//  Copyright © 2015 Jon Kent. All rights reserved.
//

import SideMenu
import WebKit
import MessageUI
import NVActivityIndicatorView

class MainViewController: UIViewController, TableDataDelegate, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var activityIndicatorView: NVActivityIndicatorView!

//    var cellTitleToPass: String!
    var sectionLabel: UILabel!
    var cellLabel : Int?
    
    private var _buttonNumber: Int!
    
    var buttonNumber: Int {
        get {
            return _buttonNumber
        }   set {
            _buttonNumber = newValue
        }
    }
    
    //TableView's cells
    enum MechanicsTableSection: Int {
        case Kinematics = 0, Dynamics, Energy, RotationalMotion, Fluids, total
    }
    
    enum ElectricityTableSection: Int {
        case Electrostatics = 0, ElectricCurrent, Magnetodynamics, total
    }
    
    enum WavesTableSection: Int {
        case Acoustics_Optics = 0, total
    }
    
    enum OtherTableSection: Int {
        case Thermal_Physics = 0, Modern_Physics, total
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        setupSideMenu()
        tableView.isHidden = true
        webView.isHidden = true
        mainView.isHidden = false
        messageLabel.text = "Core Physics"
        messageLabel.font = UIFont(name:"Courier", size: 24.0)
        messageLabel.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)

        activityIndicatorView.type = .orbit
        activityIndicatorView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        activityIndicatorView.startAnimating()
        activityIndicatorView.color = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        
        mainView.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        UIView.animate(withDuration: 3.0, delay: 0.0, options: [.repeat, .autoreverse], animations: {
            self.mainView.backgroundColor = #colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)
        })
        
        UIView.animate(withDuration: 2.0, animations: {
            self.messageLabel.frame = CGRect(x: 30-10, y: 120-374, width: 50, height: 50)
        })
        
        let attrs = [
            NSAttributedStringKey.font: UIFont(name: "Courier", size: 14)!
        ]
        UINavigationBar.appearance().titleTextAttributes = attrs
    
        sortData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func emailSend() {
        if !MFMailComposeViewController.canSendMail() {
            messageLabel.text = "Mail services are not enabled in this device"
        } else {
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            composeVC.setToRecipients(["fotistragopoulos@icloud.com"])
            composeVC.setSubject("Core Physics Support")
            composeVC.setMessageBody(" ", isHTML: false)
            self.present(composeVC, animated: true, completion: nil)
        }
    }
    
    //Dismiss the Mail View Controller
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    // Implement the protocol's function
    func dataTransfer(data: Int) {
        buttonNumber = data
        
        if buttonNumber == 1 {
            title = HeaderTitle.Mechanics.rawValue
            webView.isHidden = true
            mainView.isHidden = true
            tableView.isHidden = false
        } else if buttonNumber == 2 {
            title = HeaderTitle.Electricity.rawValue
            tableView.isHidden = false
            webView.isHidden = true
            mainView.isHidden = true
        } else if buttonNumber == 3 {
            title = HeaderTitle.Waves.rawValue
            tableView.isHidden = false
            webView.isHidden = true
            mainView.isHidden = true
        } else if buttonNumber == 4 {
            title = HeaderTitle.Other.rawValue
            tableView.isHidden = false
            webView.isHidden = true
            mainView.isHidden = true
        } else if buttonNumber == 5 {
            title = HeaderTitle.Githbub.rawValue
            tableView.isHidden = true
            webView.isHidden = true
            mainView.isHidden = true
            let url: URL = URL(string: "https://github.com/FotiosTragopoulos")!
            let urlRequest: URLRequest = URLRequest(url: url)
            webView.load(urlRequest)
            webView.isHidden = false
        } else if buttonNumber == 6 {
            title = HeaderTitle.Portfolio.rawValue
            tableView.isHidden = true
            webView.isHidden = true
            mainView.isHidden = true
            let url: URL = URL(string: "http://fotiostragopoulos.myds.me")!
            let urlRequest: URLRequest = URLRequest(url: url)
            webView.load(urlRequest)
            webView.isHidden = false
        } else if buttonNumber == 7 {
            title = HeaderTitle.Contact.rawValue
            tableView.isHidden = true
            webView.isHidden = true
            mainView.isHidden = false
            messageLabel.text = "Thanks for contacting Core Physics Support. You can excpect for a reply in 24 hours."
            emailSend()
        } else if buttonNumber == 8 {
            title = HeaderTitle.Feedback.rawValue
            tableView.isHidden = true
            webView.isHidden = true
            mainView.isHidden = true
            let url: URL = URL(string: "https://goo.gl/forms/DlsGIueAX5XfDKbu2")!
            let urlRequest: URLRequest = URLRequest(url: url)
            webView.load(urlRequest)
            webView.isHidden = false
        }
    }
    

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print(section)
        return "Section \(section)"
    }
    
    // This is the size of our header sections that we will use later on.
    let SectionHeaderHeight: CGFloat = 35
    
    // Data variable to track our sorted data.
    var mechanicsData = [MechanicsTableSection: [[String: String]]]()
    var electricityData = [ElectricityTableSection: [[String: String]]]()
    var wavesData = [WavesTableSection: [[String: String]]]()
    var otherData = [OtherTableSection: [[String: String]]]()
    
    // When generating sorted table data we can easily use our TableSection to make look up simple and easy to read.
    func sortData() {
        mechanicsData[.Kinematics] = MechanicsData.filter({ $0["genre"] == "Kinematics" })
        mechanicsData[.Dynamics] = MechanicsData.filter({ $0["genre"] == "Dynamics" })
        mechanicsData[.Energy] = MechanicsData.filter({ $0["genre"] == "Energy" })
        mechanicsData[.RotationalMotion] = MechanicsData.filter({ $0["genre"] == "Rotational Motion" })
        mechanicsData[.Fluids] = MechanicsData.filter({ $0["genre"] == "Fluids" })
        
        electricityData[.Electrostatics] = ElectricityData.filter({ $0["genre"] == "Electrostatics" })
        electricityData[.ElectricCurrent] = ElectricityData.filter({ $0["genre"] == "Electric Current" })
        electricityData[.Magnetodynamics] = ElectricityData.filter({ $0["genre"] == "Magnetodynamics" })
        
        wavesData[.Acoustics_Optics] = WavesData.filter({ $0["genre"] == "Acoustics and Optics" })
        
        otherData[.Thermal_Physics] = OtherData.filter({ $0["genre"] == "Thermal Physics" })
        otherData[.Modern_Physics] = OtherData.filter({ $0["genre"] == "Modern Physics" })
    }
    
    // As long as `total` is the last case in our TableSection enum,
    // this method will always be dynamically correct no mater how many table sections we add or remove.
    func numberOfSections(in tableView: UITableView) -> Int {
        let value = MechanicsTableSection.total.rawValue
        if title == HeaderTitle.Mechanics.rawValue {
            return MechanicsTableSection.total.rawValue
        } else if title == HeaderTitle.Electricity.rawValue {
            return ElectricityTableSection.total.rawValue
        } else if title == HeaderTitle.Waves.rawValue {
            return WavesTableSection.total.rawValue
        } else if title == HeaderTitle.Other.rawValue {
            return OtherTableSection.total.rawValue
        }
        return value
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if title == HeaderTitle.Mechanics.rawValue {
            
            let tableSection = MechanicsTableSection(rawValue: section)
            let mechanicData = mechanicsData[tableSection!]
            return (mechanicData?.count)!
        } else if title == HeaderTitle.Electricity.rawValue {
            let tableSection = ElectricityTableSection(rawValue: section)
            let elData = electricityData[tableSection!]
            return (elData?.count)!
        } else if title == HeaderTitle.Waves.rawValue {
            let tableSection = WavesTableSection(rawValue: section)
            let waveData = wavesData[tableSection!]
            return (waveData?.count)!
        } else if title == HeaderTitle.Other.rawValue {
            let tableSection = OtherTableSection(rawValue: section)
            let othData = otherData[tableSection!]
            return (othData?.count)!
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // If we wanted to always show a section header regardless of whether or not there were rows in it,
        // then uncomment this line below:
        //return SectionHeaderHeight
        
        // First check if there is a valid section of table.
        // Then we check that for the section there is more than 1 row.
        
        if title == HeaderTitle.Mechanics.rawValue {
            let tableSection = MechanicsTableSection(rawValue: section)
            let mechanicData = mechanicsData[tableSection!]
            if (mechanicData?.count)! > 0 {
                return SectionHeaderHeight
            }
        } else if title == HeaderTitle.Electricity.rawValue {
            let tableSection = ElectricityTableSection(rawValue: section)
            let elData = electricityData[tableSection!]
            if (elData?.count)! > 0 {
                return SectionHeaderHeight
            }
        } else if title == HeaderTitle.Waves.rawValue {
            let tableSection = WavesTableSection(rawValue: section)
            let waveData = wavesData[tableSection!]
            if (waveData?.count)! > 0 {
                return SectionHeaderHeight
            }
        } else if title == HeaderTitle.Other.rawValue {
            let tableSection = OtherTableSection(rawValue: section)
            let othData = otherData[tableSection!]
            if (othData?.count)! > 0 {
                return SectionHeaderHeight
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: SectionHeaderHeight))
        view.backgroundColor = UIColor(red: 88.0/255.0, green: 88.0/255.0, blue: 88.0/255.0, alpha: 1)
        sectionLabel = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.width - 30, height: SectionHeaderHeight))
        sectionLabel.font = UIFont.boldSystemFont(ofSize: 18)
        sectionLabel.textColor = UIColor.white

        if title == HeaderTitle.Mechanics.rawValue {
            let tableSection = MechanicsTableSection(rawValue: section)
            switch tableSection {
            case .Kinematics?:
                sectionLabel.text = "Kinematics"
            case .Dynamics?:
                sectionLabel.text = "Dynamics"
            case .Energy?:
                sectionLabel.text = "Energy"
            case .RotationalMotion?:
                sectionLabel.text = "Rotational Motion"
            case .Fluids?:
                sectionLabel.text = "Fluids"
            default:
                sectionLabel.text = ""
            }
        } else if title == HeaderTitle.Electricity.rawValue {
            let tableSection = ElectricityTableSection(rawValue: section)
            switch tableSection {
            case .Electrostatics?:
                sectionLabel.text = "Electrostatics"
            case .ElectricCurrent?:
                sectionLabel.text = "Electric Current"
            case .Magnetodynamics?:
                sectionLabel.text = "Magnetodynamics"
            default:
                sectionLabel.text = ""
            }
        } else if title == HeaderTitle.Waves.rawValue {
            let tableSection = WavesTableSection(rawValue: section)
            switch tableSection {
            case .Acoustics_Optics?:
                sectionLabel.text = "Acoustics Optics"
            default:
                sectionLabel.text = ""
            }
        } else if title == HeaderTitle.Other.rawValue {
            let tableSection = OtherTableSection(rawValue: section)
            switch tableSection {
            case .Thermal_Physics?:
                sectionLabel.text = "Thermal Physics"
            case .Modern_Physics?:
                sectionLabel.text = "Modern Physics"
            default:
                sectionLabel.text = ""
            }
        }
        view.addSubview(sectionLabel)
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        // Similar to above, first check if there is a valid section of table.
        // Then we check that for the section there is a row.
        
        if title == HeaderTitle.Mechanics.rawValue {
            let tableSection = MechanicsTableSection(rawValue: indexPath.section)
            let mainTitle = mechanicsData[tableSection!]?[indexPath.row]
            if let titleLabel = cell.viewWithTag(10) as? UILabel {
                titleLabel.text = mainTitle?["title"]
            }
            if let subtitleLabel = cell.viewWithTag(20) as? UILabel {
                subtitleLabel.text = mainTitle?["subtitle"]
            }
        } else if title == HeaderTitle.Electricity.rawValue {
            let tableSection = ElectricityTableSection(rawValue: indexPath.section)
            let mainTitle = electricityData[tableSection!]?[indexPath.row]
            if let titleLabel = cell.viewWithTag(10) as? UILabel {
                titleLabel.text = mainTitle?["title"]
            }
            if let subtitleLabel = cell.viewWithTag(20) as? UILabel {
                subtitleLabel.text = mainTitle?["subtitle"]
            }
        } else if title == HeaderTitle.Waves.rawValue {
            let tableSection = WavesTableSection(rawValue: indexPath.section)
            let mainTitle = wavesData[tableSection!]?[indexPath.row]
            if let titleLabel = cell.viewWithTag(10) as? UILabel {
                titleLabel.text = mainTitle?["title"]
            }
            if let subtitleLabel = cell.viewWithTag(20) as? UILabel {
                subtitleLabel.text = mainTitle?["subtitle"]
            }
        } else if title == HeaderTitle.Other.rawValue {
            let tableSection = OtherTableSection(rawValue: indexPath.section)
            let mainTitle = otherData[tableSection!]?[indexPath.row]
            if let titleLabel = cell.viewWithTag(10) as? UILabel {
                titleLabel.text = mainTitle?["title"]
            }
            if let subtitleLabel = cell.viewWithTag(20) as? UILabel {
                subtitleLabel.text = mainTitle?["subtitle"]
            }            
        }
        return cell
    }
    
    // Define the menus
    fileprivate func setupSideMenu() {
        SideMenuManager.default.menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? UISideMenuNavigationController
        SideMenuManager.default.menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "RightMenuNavigationController") as? UISideMenuNavigationController
        setDefaults()
    }

    // Customise the menus
    func setDefaults() {
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuBlurEffectStyle = .dark
        SideMenuManager.default.menuAnimationFadeStrength = 0.5
        SideMenuManager.default.menuShadowOpacity = 0.1
        SideMenuManager.default.menuAnimationTransformScaleFactor = 0.7
        SideMenuManager.default.menuWidth = view.frame.width * 0.3
        SideMenuManager.default.menuAnimationBackgroundColor = UIColor(patternImage: UIImage(named: "background")!)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Send Data From UITableViewController to DetailViewController
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let targetViewController = storyBoard.instantiateViewController(withIdentifier: "CalculatorViewController") as! CalculatorViewController
        
        if title == HeaderTitle.Mechanics.rawValue {
            let tableSection = MechanicsTableSection(rawValue: indexPath.section)
            let mainTitle = mechanicsData[tableSection!]?[indexPath.row]
            targetViewController.calculatorLabel = (mainTitle?["title"])!
        } else if title == HeaderTitle.Electricity.rawValue {
            let tableSection = ElectricityTableSection(rawValue: indexPath.section)
            let mainTitle = electricityData[tableSection!]?[indexPath.row]
            targetViewController.calculatorLabel = (mainTitle?["title"])!
        } else if title == HeaderTitle.Waves.rawValue {
            let tableSection = WavesTableSection(rawValue: indexPath.section)
            let mainTitle = wavesData[tableSection!]?[indexPath.row]
            targetViewController.calculatorLabel = (mainTitle?["title"])!
        } else if title == HeaderTitle.Other.rawValue {
            let tableSection = OtherTableSection(rawValue: indexPath.section)
            let mainTitle = otherData[tableSection!]?[indexPath.row]
            targetViewController.calculatorLabel = (mainTitle?["title"])!
        }
        self.navigationController?.pushViewController(targetViewController, animated: true)
    }
    
    // Prepare for segue with Navigation View Controller and delegate
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSideMenu" {
            let sideMenuTableViewController = segue.destination as! UINavigationController
            let destinatioViewController = sideMenuTableViewController.viewControllers.first as! SideMenuTableViewController
            destinatioViewController.delegate = self
        } 
    }
}

