import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/text_form_field/custom_text_form_field.dart';
import '../../../core/widgets/buttons/custom_primary_button.dart';
import '../../../core/widgets/logo/netflix_logo_widget.dart';
import '../../../core/widgets/header_cards/header_cards_widget.dart';
import '../../../core/widgets/buttons/terms_checkbox.dart';
import '../../../core/widgets/icons/figma_icons.dart';
import '../../../core/widgets/icons/auth_icons.dart';
import '../../../core/mixins/validators_mixin.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with ValidatorsMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _yukleniyor = false;
  bool _termsAccepted = false;

  // apiden gelecek film görselleri
  final List<String> _moviePosters = [
    // 'assets/images/movie1.jpg', // Superman
    // 'assets/images/movie2.jpg', // Horror film
    // 'assets/images/movie3.jpg', // Racing film
    // 'assets/images/movie4.jpg', // Action film
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _kayitOl() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (!_termsAccepted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Lütfen kullanıcı sözleşmesini kabul edin'),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }

      setState(() {
        _yukleniyor = true;
      });

      // Kayıt işlemi simülasyonu
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _yukleniyor = false;
      });

      // Ana sayfaya yönlendir veya başarı mesajı göster
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Kayıt başarılı!'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    }
  }

  void _sosyalMedyaGirisi(String platform) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$platform ile kayıt olunacak'),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _girisSayfasi() {
    Navigator.pop(context);
  }

  void _filmKartiTiklandi(int index) {
    // Film kartına tıklandığında çalışacak
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Film kartı ${index + 1} tıklandı'),
        backgroundColor: AppColors.primary,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Şifre tekrarı gereklidir';
    }
    if (value != _passwordController.text) {
      return 'Şifreler eşleşmiyor';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        toolbarHeight: 60, // AppBar yüksekliği
        automaticallyImplyLeading: false, // Geri butonu kaldır
        flexibleSpace: Container(), // Boş alan
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // Header Cards - Üstteki dağınık kartlar
              SizedBox(
                height: 200, // Sabit yükseklik ver
                child: HeaderCardsWidget(
                  moviePosters: _moviePosters,
                  onCardTap: _filmKartiTiklandi,
                ),
              ),
              
              const SizedBox(height: 24), // Figma'dan gap: 24px

              SizedBox(
                width: 354,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          // Netflix Logo
                          const NetflixLogoWidget(),
                          
                          const SizedBox(height: 24), // Figma'dan gap

                          Column(
                            children: [
                              // "Hesap Oluştur" başlığı
                              SizedBox(
                                width: 256,
                                height: 29,
                                child: Text(
                                  AppStrings.register,
                                  style: AppTextStyles.kayitOlBaslik,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              
                              const SizedBox(height: 12), // Figma'dan gap
                              
                              // Alt başlık
                              SizedBox(
                                width: 190,
                                height: 17,
                                child: Text(
                                  AppStrings.registerSubtitle,
                                  style: AppTextStyles.altBaslik,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 36), // Figma'dan gap

                      Column(
                        children: [
                          FigmaInputField(
                            hintText: AppStrings.namePlaceholder,
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Ad soyad gereklidir';
                              }
                              return null;
                            },
                            prefixIcon: AuthIcons.person(size: 24),
                          ),
                          
                          const SizedBox(height: 16), // Figma'dan gap

                          FigmaInputField(
                            hintText: AppStrings.emailPlaceholder,
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: validateEmail,
                            prefixIcon: AuthIcons.email(size: 24),
                          ),
                          
                          const SizedBox(height: 16),
                          
                          // Şifre input
                          FigmaInputField(
                            hintText: AppStrings.passwordPlaceholder,
                            controller: _passwordController,
                            sifreAlani: true,
                            textInputAction: TextInputAction.next,
                            validator: validatePassword,
                            prefixIcon: AuthIcons.lock(size: 24),
                          ),
                          
                          const SizedBox(height: 16),
                          
                          // Şifre Tekrar input
                          FigmaInputField(
                            hintText: AppStrings.confirmPasswordPlaceholder,
                            controller: _confirmPasswordController,
                            sifreAlani: true,
                            textInputAction: TextInputAction.done,
                            validator: _validateConfirmPassword,
                            prefixIcon: AuthIcons.lock(size: 24),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 16), // Figma'dan gap
                      
                      // Kullanıcı sözleşmesi checkbox
                      TermsCheckbox(
                        value: _termsAccepted,
                        onChanged: (value) {
                          setState(() {
                            _termsAccepted = value;
                          });
                        },
                      ),
                      
                      const SizedBox(height: 24), // Figma'dan gap
                      
                      // Ana kayıt butonu
                      FigmaPrimaryButton(
                        text: 'Kaydol', // Figma'da "Kaydol" yazıyor
                        onPressed: _kayitOl,
                        isLoading: _yukleniyor,
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24), // Figma'dan gap

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FigmaSocialButton(
                    icon: FigmaIcons.google(size: 24),
                    onPressed: () => _sosyalMedyaGirisi('Google'),
                  ),
                  
                  const SizedBox(width: 15),
                  
                  FigmaSocialButton(
                    icon: FigmaIcons.apple(size: 24),
                    onPressed: () => _sosyalMedyaGirisi('Apple'),
                  ),
                  
                  const SizedBox(width: 15),
                  
                  FigmaSocialButton(
                    icon: FigmaIcons.facebook(size: 24),
                    onPressed: () => _sosyalMedyaGirisi('Facebook'),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 129,
                    height: 17,
                    child: Text(
                      AppStrings.haveAccount,
                      style: AppTextStyles.hesabinYokMu,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  
                  const SizedBox(width: 8),
                  
                  FigmaTextButton(
                    text: AppStrings.goToLogin,
                    onPressed: _girisSayfasi,
                    textStyle: AppTextStyles.kayitOlButon,
                  ),
                ],
              ),
            
              const SizedBox(height: 32), // Alt boşluk
            ],
          ),
        ),
      ),
    );
  }
}
