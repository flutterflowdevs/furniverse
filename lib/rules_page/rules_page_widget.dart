import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rules_page_model.dart';
export 'rules_page_model.dart';

class RulesPageWidget extends StatefulWidget {
  const RulesPageWidget({Key? key}) : super(key: key);

  @override
  _RulesPageWidgetState createState() => _RulesPageWidgetState();
}

class _RulesPageWidgetState extends State<RulesPageWidget> {
  late RulesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RulesPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF50A9B0),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Privacy & Policy',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Lufga',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: false,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 10.0, 20.0),
                        child: Text(
                          'At FurniVerse, we value the privacy and security of our users. This Privacy Policy outlines how we collect, use, and protect your personal information when you use our ecommerce app and services. By accessing or using our app, you consent to the practices described in this policy.\n\n1. Information We Collect:\n   - Personal Information: When you create an account, place an order, or interact with our app, we may collect personal information such as your name, email address, shipping address, and payment details.\n   - Usage Information: We gather information about how you use our app, including the pages you visit, products you view, and interactions with features or advertisements.\n\n2. How We Use Your Information:\n   - Personalization: We use your information to provide personalized experiences, such as displaying relevant products, recommendations, or tailored marketing communications.\n   - Order Processing: We use your information to process and fulfill your orders, including payment processing, shipping, and customer support.\n   - Communication: We may contact you with order updates, promotional offers, or important service announcements. You can opt-out of receiving marketing communications at any time.\n   - Improving Our Services: We analyze usage data to improve our app, enhance user experience, and optimize our product offerings.\n\n3. Information Sharing:\n   - Third-Party Service Providers: We may share your information with trusted third-party service providers who assist us in operating our app, processing payments, or delivering products.\n   - Legal Requirements: We may disclose your information in response to legal processes or when required by law to protect our rights, safety, or the rights and safety of others.\n\n4. Data Security:\n   - We employ industry-standard security measures to protect your personal information from unauthorized access, misuse, or loss.\n   - However, please note that no data transmission or storage system can be guaranteed to be 100% secure. We cannot ensure the absolute security of your information.\n\n5. Your Choices:\n   - Account Settings: You can review and update your account information and communication preferences by accessing your account settings.\n   - Cookies and Tracking Technologies: You have the option to manage cookies and tracking technologies through your device or browser settings.\n\n6. Children\'s Privacy:\n   - Our app is not intended for individuals under the age of 13. We do not knowingly collect personal information from children. If you become aware that your child has provided us with personal information, please contact us to have it removed.\n\n7. Updates to this Policy:\n   - We may update this Privacy Policy from time to time. We encourage you to review the latest version whenever you use our app.\n\nIf you have any questions or concerns regarding our Privacy Policy, please contact us at admin@furniverse.com.\n\nNote: This privacy content is a general example and should be tailored to your specific app and business requirements. It is recommended to consult with legal professionals to ensure compliance with applicable laws and regulations.',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lufga',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
