//
//  ViewController.swift
//  SportClub
//
//  Created by Home on 11/17/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate,UITableViewDataSource {
//=======Text Filed===============
    @IBOutlet weak var FirstN: UITextField!
    @IBOutlet weak var LastN: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Phone: UITextField!
    @IBOutlet weak var Adr1: UITextField!
    @IBOutlet weak var Adr2: UITextField!
    @IBOutlet weak var City: UITextField!
    @IBOutlet weak var Region: UITextField!
    @IBOutlet weak var ZipCode: UITextField!
    //@IBOutlet weak var Countries: UITextField!
    //======= DATE ================
    @IBOutlet weak var DateTF: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    let dateFormatter = DateFormatter()
    @IBOutlet weak var btnDrop: UIButton!
    //======== Drop List Countries =========
    @IBOutlet weak var countriesListTableView: UITableView!
    //var CountriesList = ["France","United State","India","Mexico","Germany"]
    
    
    var CountriesList = ["BD Bangladesh", "BE Belgium", "BF Burkina Faso", "BG Bulgaria", "BA Bosnia and Herzegovina", "BB Barbados", "WF Wallis and Futuna", "BL Saint Barthelemy", "BM Bermuda", "BN Brunei", "BO Bolivia", "BH Bahrain", "BI Burundi", "BJ Benin", "BT Bhutan", "JM Jamaica", "BV Bouvet Island", "BW Botswana", "WS Samoa", "BQ Bonaire, Saint Eustatius and Saba ", "BR Brazil", "BS Bahamas", "JE Jersey", "BY Belarus", "BZ Belize", "RU Russia", "RW Rwanda", "RS Serbia", "TL East Timor", "RE Reunion", "TM Turkmenistan", "TJ Tajikistan", "RO Romania", "TK Tokelau", "GW Guinea-Bissau", "GU Guam", "GT Guatemala", "GS South Georgia and the South Sandwich Islands", "GR Greece", "GQ Equatorial Guinea", "GP Guadeloupe", "JP Japan", "GY Guyana", "GG Guernsey", "GF French Guiana", "GE Georgia", "GD Grenada", "GB United Kingdom", "GA Gabon", "SV El Salvador", "GN Guinea", "GM Gambia", "GL Greenland", "GI Gibraltar", "GH Ghana", "OM Oman", "TN Tunisia", "JO Jordan", "HR Croatia", "HT Haiti", "HU Hungary", "HK Hong Kong", "HN Honduras", "HM Heard Island and McDonald Islands", "VE Venezuela", "PR Puerto Rico", "PS Palestinian Territory", "PW Palau", "PT Portugal", "SJ Svalbard and Jan Mayen", "PY Paraguay", "IQ Iraq", "PA Panama", "PF French Polynesia", "PG Papua New Guinea", "PE Peru", "PK Pakistan", "PH Philippines", "PN Pitcairn", "PL Poland", "PM Saint Pierre and Miquelon", "ZM Zambia", "EH Western Sahara", "EE Estonia", "EG Egypt", "ZA South Africa", "EC Ecuador", "IT Italy", "VN Vietnam", "SB Solomon Islands", "ET Ethiopia", "SO Somalia", "ZW Zimbabwe", "SA Saudi Arabia", "ES Spain", "ER Eritrea", "ME Montenegro", "MD Moldova", "MG Madagascar", "MF Saint Martin", "MA Morocco", "MC Monaco", "UZ Uzbekistan", "MM Myanmar", "ML Mali", "MO Macao", "MN Mongolia", "MH Marshall Islands", "MK Macedonia", "MU Mauritius", "MT Malta", "MW Malawi", "MV Maldives", "MQ Martinique", "MP Northern Mariana Islands", "MS Montserrat", "MR Mauritania", "IM Isle of Man", "UG Uganda", "TZ Tanzania", "MY Malaysia", "MX Mexico", "IL Israel", "FR France", "IO British Indian Ocean Territory", "SH Saint Helena", "FI Finland", "FJ Fiji", "FK Falkland Islands", "FM Micronesia", "FO Faroe Islands", "NI Nicaragua", "NL Netherlands", "NO Norway", "NA Namibia", "VU Vanuatu", "NC New Caledonia", "NE Niger", "NF Norfolk Island", "NG Nigeria", "NZ New Zealand", "NP Nepal", "NR Nauru", "NU Niue", "CK Cook Islands", "XK Kosovo", "CI Ivory Coast", "CH Switzerland", "CO Colombia", "CN China", "CM Cameroon", "CL Chile", "CC Cocos Islands", "CA Canada", "CG Republic of the Congo", "CF Central African Republic", "CD Democratic Republic of the Congo", "CZ Czech Republic", "CY Cyprus", "CX Christmas Island", "CR Costa Rica", "CW Curacao", "CV Cape Verde", "CU Cuba", "SZ Swaziland", "SY Syria", "SX Sint Maarten", "KG Kyrgyzstan", "KE Kenya", "SS South Sudan", "SR Suriname", "KI Kiribati", "KH Cambodia", "KN Saint Kitts and Nevis", "KM Comoros", "ST Sao Tome and Principe", "SK Slovakia", "KR South Korea", "SI Slovenia", "KP North Korea", "KW Kuwait", "SN Senegal", "SM San Marino", "SL Sierra Leone", "SC Seychelles", "KZ Kazakhstan", "KY Cayman Islands", "SG Singapore", "SE Sweden", "SD Sudan", "DO Dominican Republic", "DM Dominica", "DJ Djibouti", "DK Denmark", "VG British Virgin Islands", "DE Germany", "YE Yemen", "DZ Algeria", "US United States", "UY Uruguay", "YT Mayotte", "UM United States Minor Outlying Islands", "LB Lebanon", "LC Saint Lucia", "LA Laos", "TV Tuvalu", "TW Taiwan", "TT Trinidad and Tobago", "TR Turkey", "LK Sri Lanka", "LI Liechtenstein", "LV Latvia", "TO Tonga", "LT Lithuania", "LU Luxembourg", "LR Liberia", "LS Lesotho", "TH Thailand", "TF French Southern Territories", "TG Togo", "TD Chad", "TC Turks and Caicos Islands", "LY Libya", "VA Vatican", "VC Saint Vincent and the Grenadines", "AE United Arab Emirates", "AD Andorra", "AG Antigua and Barbuda", "AF Afghanistan", "AI Anguilla", "VI U.S. Virgin Islands", "IS Iceland", "IR Iran", "AM Armenia", "AL Albania", "AO Angola", "AQ Antarctica", "AS American Samoa", "AR Argentina", "AU Australia", "AT Austria", "AW Aruba", "IN India", "AX Aland Islands", "AZ Azerbaijan", "IE Ireland", "ID Indonesia", "UA Ukraine", "QA Qatar", "MZ Mozambique"]
    
    // =======  Select Radio button =========
    @IBOutlet weak var btnFootball: UIButton!
    @IBOutlet weak var btnHockey: UIButton!
    @IBOutlet weak var btnTennis: UIButton!
    @IBOutlet weak var btnShuttle: UIButton!
    
    //========  Terms selected  ======
    
    @IBOutlet weak var btnTerms: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Delegate allows the interactions
        FirstN.delegate = self
        LastN.delegate  = self
        Email.delegate  = self
        Phone.delegate  = self
        Adr1.delegate   = self
        City.delegate   = self
        Region.delegate = self
        ZipCode.delegate = self

        
        
        
        //FirstN.becomeFirstResponder()
        dateFormatter.dateFormat = "mm/dd/yyyy"
        //DateTF.inputView = datePicker
        datePicker.datePickerMode = .date
        DateTF.text = dateFormatter.string(from: datePicker.date)
        // Countries list
        countriesListTableView.delegate=self
        countriesListTableView.dataSource=self
        countriesListTableView.isHidden = true
        
    }
    
    
    @IBAction func TermsSelected(_ sender: UIButton) {
        if(sender.isSelected){
            sender.isSelected = false
        }
        else{
            sender.isSelected = true
        }

    }
    
    
    // =======  Action for radio button ========
    
    @IBAction func Radio_FB(_ sender: UIButton) {
        if(sender.isSelected){
            sender.isSelected = false
        }
        else{
            sender.isSelected = true
            btnHockey.isSelected = false
            btnTennis.isSelected = false
            btnShuttle.isSelected = false

        }
    }
    
    @IBAction func Radio_HK(_ sender: UIButton) {
        if(sender.isSelected){
            sender.isSelected = false
        }
        else{
            sender.isSelected = true
            btnFootball.isSelected = false
            btnTennis.isSelected = false
            btnShuttle.isSelected = false

        }

    }
    
    @IBAction func Radio_TN(_ sender: UIButton) {
        if(sender.isSelected){
            sender.isSelected = false
        }
        else{
            sender.isSelected = true
            btnFootball.isSelected = false
            btnHockey.isSelected = false
            btnShuttle.isSelected = false

        }

    }
        
    @IBAction func Radio_ST(_ sender: UIButton) {
        if(sender.isSelected){
            sender.isSelected = false
        }
        else{
            sender.isSelected = true
            btnFootball.isSelected = false
            btnTennis.isSelected = false
            btnHockey.isSelected = false

        }

    }
    // button allows to display the table view
    @IBAction func countriesOnClick(_ sender: UIButton) {
        if self.countriesListTableView.isHidden{
            UIView.animate(withDuration: 0.3){
                self.countriesListTableView.isHidden = false
            }
        }
        else{
            UIView.animate(withDuration: 0.3){
                self.countriesListTableView.isHidden = true
            }
        }
    }
    
    // button to display DatePicker
    // dataPicker accept for people more 10 years old = birth is before 2011
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        DateTF.text = dateFormatter.string(from: datePicker.date)
        //view.endEditing(true)
    }
    // function sending alart with message
    func SendAlert(_ messageAlert: String){
        let action = UIAlertAction(title: "OK", style: .default) {(action) in
            self.dismiss(animated: false)
        }
        let alert = UIAlertController(title: "Fields", message: messageAlert, preferredStyle: .alert)
        alert.addAction(action)
        self.present(alert, animated: false, completion: nil)
    }

    
    func CheckFormGood() -> Bool{
        var checkform: Bool = true
        if (FirstN.text!.isEmpty) ||
            (LastN.text!.isEmpty) ||
            (Email.text!.isEmpty) ||
            (Phone.text!.isEmpty) ||
            (Adr1.text!.isEmpty) ||
            (City.text!.isEmpty) ||
            (Region.text!.isEmpty) ||
            (ZipCode.text!.isEmpty) ||
            // CHECK IF CONTRY HAS BEEN SELECTED
            (!(btnDrop.isSelected))
            {
                checkform = false
            }
            if (!(btnFootball.isSelected) &&
                !(btnHockey.isSelected) &&
                !(btnTennis.isSelected) &&
                !(btnShuttle.isSelected)){
                checkform = false
            }
            if (!(btnTerms.isSelected)){
                checkform = false
            }

        return checkform
    }
    // button to send form
    // control all field and display the message
    @IBAction func FormBtn(_ sender: UIButton) {
        if (CheckFormGood()) {
            SendAlert("Data has been sent successfully")
        }
        else {
            SendAlert("Please fill all the details")
        }
     
    }
    
    // when you start to select the field
 /*   func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField is being edited")
    }   */
    // when you quit the field = select another field
    func textFieldDidEndEditing(_ textField: UITextField) {
        if FirstN.text == LastN.text {
            SendAlert("Your first and last name are the same, please correct if need")
        }
    }
    
    // this method is relative to the command : FirstN.delegate=self
    // BEFORE the text is inputted, this function is called, If return true then text can be inputted, if return false then the text is NOT AUTHORIZED to input
    /*
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if FirstN.text == LastN.text {
            print("First = Last")
            return false
        }
        else {
            print("Not equal")
            return true
        }
        
    }
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CountriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countriesListTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        // Here, la selection of the country but the button is not set yet
        cell.TitleLabel.text = CountriesList[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // set the value from the tableViewCell selected to the button
        btnDrop.setTitle("\(CountriesList[indexPath.row])", for: .normal)
        // THIS ALLOWS TO CHECK IF AT LEAST ONE COUNTRY HAS BEEN SELECTED
        btnDrop.isSelected = true
        
        UIView.animate(withDuration: 0.3){
            self.countriesListTableView.isHidden = true
        }
        btnDrop.setTitleColor(.black, for: .normal)

    }

    
    
    
}

