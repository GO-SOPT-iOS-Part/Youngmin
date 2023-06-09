import UIKit
import SnapKit
import Then

class Tving2ViewController : UIViewController {
    var backgroundHiddenCompletionHandler : ((Bool) -> (Void))?
    var nickNameCompletionHandler : ((String) -> (Void))?
    var userInfoText = ""
    
    // MARK: - PROPERTIES
    private let tvingImageView = UIImageView().then {
        $0.image = UIImage(named: "img_tving")
    }
    
    private let greetingLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.font = .tvingBold(ofSize: 24)
        $0.textColor = UIColor.colorD6D6D6
        $0.textAlignment = .center
    }
    
    private let backButton = UIButton().then {
        $0.setTitle("메인으로", for: .normal)
        $0.setTitleColor(UIColor.colorFFFFFF, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 16)
        $0.backgroundColor = UIColor.colorFF143C
    }
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
        actions()     }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ///텍스트가 정해지기 전 설정을 하면 작동하지 않음 -> 생명주기에 차이를 주기
       // greetingLabel.setLineSpacing(lineHeightMultiple: 1.33)
        //greetingLabel.textAlignment = .center
    }
    
    
    // MARK: - ACTIONS
    private func actions() {
    //    closeBottomSheetButton.addTarget(self, action: #selector(closeBottomSheetButtonTapped), for: .touchUpInside)
    //    saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    @objc func closeBottomSheetButtonTapped() {
        dismiss(animated: true)
        backgroundHiddenCompletionHandler?(true)
    }
    @objc func saveButtonTapped() {
        dismiss(animated: true)
        backgroundHiddenCompletionHandler?(true)
        //nickNameCompletionHandler?(nickNameTextField.text ?? "")
    }
}// MARK: - EXTENSIONs
extension Tving2ViewController {
    ///줄 간격 벌리기
    func spaceLines(label : UILabel, lineHeight : Double) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineHeight
        let stringValue = NSMutableAttributedString(string: label.text ?? "")
        stringValue.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, stringValue.length))
        label.attributedText = stringValue
    }
    
    func style() {
        view.backgroundColor = UIColor.color000000
    }
    func setLayout() {
        [tvingImageView, greetingLabel, backButton].forEach {
            view.addSubview($0)
        }
        tvingImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(view.frame.width * 211 / 375)
        }
        greetingLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(tvingImageView.snp.bottom).offset(66)
        }
        backButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-66)
            $0.height.equalTo(52)
        }
    }
}
