import 'package:flutter/material.dart';
import 'package:odin/providers/login_form_provider.dart';
import 'package:odin/services/services.dart';
import 'package:odin/theme/app_themes.dart';
import 'package:odin/widgets/auth_background.dart';
import 'package:odin/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatelessWidget {
   
  const CreateAccountScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: AuthBackground(
        textTitle: 'Start your healthy life now',
        textSubtitle: 'Loremp ipsum dolor sit amet',
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.4,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                width: double.infinity,
                child: Column(
                  children: [

                    ChangeNotifierProvider(
                      create: ( _ ) => LoginFormProvider(),
                      child : _CreateFormAccount(),
                    ),

                    SizedBox(height: 40,),
                    _Login()

                  ],
                ),
              )
            ],
          ),
        )
      )
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [

          const Text(
            "Already have an account?",
            style: TextStyle(fontSize: 16, color: Colors.grey),),
          
          const SizedBox(height: 20,),

          MaterialButton(
            color: const Color(0xffececec),
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
              child: const Text(
                'LOGIN',
                style: TextStyle(fontSize: 16),
                )
              ),
            onPressed: (){
              Navigator.pushReplacementNamed(context, 'login');
            }  
          ),

          const SizedBox(height: 10,)
        
        ],
      ),);
  }
}

class _CreateFormAccount extends StatelessWidget {
  const _CreateFormAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      padding: EdgeInsets.all(20),
      decoration: _FormBoxDecoration(),
      child: Form(
        key: loginForm.formKey,
        child: Column(
          children: [

            // CustomerInputField(
            //   hintText: 'Erick',
            //   labelText: 'User',
            //   icon: Icons.person_outline_rounded,
            // ),

            const SizedBox(height: 20,),

            CustomerInputField(
              hintText: 'email@gmail.com',
              labelText: 'Email',
              icon: Icons.alternate_email_rounded,
              keyboardType: TextInputType.emailAddress,
              onChange: (value) => loginForm.email = value,
              validator: (value){
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);
                return regExp.hasMatch(value ?? '') ? null : 'Formato de Correo Incorrecto';
              },
            ),

            const SizedBox(height: 20,),

            CustomerInputField(
              hintText: '****',
              labelText: 'Password',
              icon: Icons.lock,
              onChange: (value) => loginForm.password = value,
              validator: (value){
                if(value == null) return 'Nulo';
                return value.length < 6 ? 'Mas de 6 caracteres' : null;
              },
            ),
            
            const SizedBox(height: 20,),

            MaterialButton(
              color: AppThemes.colorPrimary,
              disabledColor: Colors.grey,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                alignment: Alignment.center,
                child: Text('SIGN UP', style: TextStyle(color: Colors.white, fontSize: 16),)
                ),
              onPressed: loginForm.isLoading ? null : () async { 
                
                FocusScope.of(context).unfocus();
                final authService = Provider.of<AuthService>(context, listen: false);

                if( !loginForm.isValidate() ) return;
                
                loginForm.isLoading = true;

                final String? errorMessage = await authService.createUser(loginForm.email, loginForm.password);

                if(errorMessage == null){
                  
                  Navigator.pushNamed(context, 'home');

                }else{
                  print(errorMessage);
                  loginForm.isLoading = false;
                }
                



               },
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _FormBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        offset: Offset(0, 10)
      )
    ]);
}