import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:thingsboard_app/core/auth/login/login_page_background.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class ResetPasswordRequestPage extends TbPageWidget {
  ResetPasswordRequestPage(TbContext tbContext, {Key? key})
      : super(tbContext, key: key);

  @override
  _ResetPasswordRequestPageState createState() =>
      _ResetPasswordRequestPageState();
}

class _ResetPasswordRequestPageState
    extends TbPageState<ResetPasswordRequestPage> {
  final _isLoadingNotifier = ValueNotifier<bool>(false);

  final _resetPasswordFormKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      const LoginPageBackground(),
      SizedBox.expand(
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: TbAppBar(
                tbContext,
                title: const Text('Reset password'),
              ),
              body: Stack(children: [
                SizedBox.expand(
                    child: Padding(
<<<<<<< Updated upstream
                        padding: const EdgeInsets.all(24),
=======
                        padding: EdgeInsets.all(24),
>>>>>>> Stashed changes
                        child: FormBuilder(
                            key: _resetPasswordFormKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
<<<<<<< Updated upstream
                                  const SizedBox(height: 16),
                                  const Text(
=======
                                  SizedBox(height: 16),
                                  Text(
>>>>>>> Stashed changes
                                    'Enter the email associated with your account and we\'ll send an email with password reset link',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFFAFAFAF),
                                        fontSize: 14,
                                        height: 24 / 14),
                                  ),
<<<<<<< Updated upstream
                                  const SizedBox(height: 61),
=======
                                  SizedBox(height: 61),
>>>>>>> Stashed changes
                                  FormBuilderTextField(
                                    name: 'email',
                                    autofocus: true,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(context,
                                          errorText: 'Email is required.'),
                                      FormBuilderValidators.email(context,
                                          errorText: 'Invalid email format.')
                                    ]),
<<<<<<< Updated upstream
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Email *'),
                                  ),
                                  const Spacer(),
                                  ElevatedButton(
                                    child: const Text('Request password reset'),
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16)),
=======
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Email *'),
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                    child: Text('Request password reset'),
                                    style: ElevatedButton.styleFrom(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 16)),
>>>>>>> Stashed changes
                                    onPressed: () {
                                      _requestPasswordReset();
                                    },
                                  )
                                ])))),
                ValueListenableBuilder<bool>(
                    valueListenable: _isLoadingNotifier,
                    builder: (BuildContext context, bool loading, child) {
                      if (loading) {
                        return SizedBox.expand(
                            child: Container(
<<<<<<< Updated upstream
                          color: const Color(0x99FFFFFF),
                          child: const Center(
                              child: TbProgressIndicator(size: 50.0)),
                        ));
                      } else {
                        return const SizedBox.shrink();
=======
                          color: Color(0x99FFFFFF),
                          child: Center(child: TbProgressIndicator(size: 50.0)),
                        ));
                      } else {
                        return SizedBox.shrink();
>>>>>>> Stashed changes
                      }
                    })
              ])))
    ]));
  }

  void _requestPasswordReset() async {
    FocusScope.of(context).unfocus();
    if (_resetPasswordFormKey.currentState?.saveAndValidate() ?? false) {
      var formValue = _resetPasswordFormKey.currentState!.value;
      String email = formValue['email'];
      _isLoadingNotifier.value = true;
      try {
        await Future.delayed(const Duration(milliseconds: 300));
        await tbClient.sendResetPasswordLink(email);
        _isLoadingNotifier.value = false;
        showSuccessNotification('Password reset link was successfully sent!');
      } catch (e) {
        _isLoadingNotifier.value = false;
      }
    }
  }
}
