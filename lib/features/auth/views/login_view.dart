import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/text_form_field/custom_text_form_field.dart';
import '../../../core/widgets/buttons/custom_primary_button.dart';
import '../../../core/widgets/logo/netflix_logo_widget.dart';
import '../../../core/widgets/header_cards/header_cards_widget.dart';
import '../../../core/widgets/icons/figma_icons.dart';
import '../../../core/widgets/icons/auth_icons.dart';
import '../../../core/mixins/validators_mixin.dart';
import 'register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with ValidatorsMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _yukleniyor = false;

  // apiden gelecek filmler olacak burada.
  final List<String> _moviePosters = [
    // 'assets/images/movie1.jpg', // Superman
    // 'assets/images/movie2.jpg', // Horror film
    // 'assets/images/movie3.jpg', // Racing film
    // 'assets/images/movie4.jpg', // Action film
  ];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _girisYap() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _yukleniyor = true;
      });

      // Giriş işlemi simülasyonu
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _yukleniyor = false;
      });

      // Ana sayfaya yönlendir veya başarı mesajı göster
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Giriş başarılı!'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    }
  }

  void _sosyalMedyaGirisi(String platform) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$platform ile giriş yapılacak'),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _sifreUnut() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Şifre sıfırlama sayfasına yönlendirilecek'),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _kayitSayfasi() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterView(),
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60, // AppBar yüksekliği
        automaticallyImplyLeading: false, // Geri butonu kaldır
        flexibleSpace: Container(), // Boş alan
      ),
      body: Stack(
        children: [
          // Gradient background (CSS: linear-gradient(0deg, #090909 40%, #3F0306 100%))
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0xFF090909),
                    Color(0xFF3F0306),
                  ],
                  stops: [0.4, 1.0],
                ),
              ),
            ),
          ),

          // Shine Effect (CSS: radial-gradient with blur)
          Positioned(
            left: 43,
            top: -71,
            child: SizedBox(
              width: 310,
              height: 208,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 25.3, sigmaY: 25.3),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.center,
                      radius: 0.9,
                      colors: [
                        Color(0xFFFF1B1B),
                        Color(0x008D0000),
                      ],
                      stops: [0.0, 1.0],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Content
          SingleChildScrollView(
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

                  // Ana içerik
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

                              // Başlık ve alt başlık - Figma Frame 2609003
                              Column(
                                children: [
                                  // "Giriş Yap" başlığı
                                  SizedBox(
                                    width: 256,
                                    height: 29,
                                    child: Text(
                                      AppStrings.login,
                                      style: AppTextStyles.girisYapBaslik,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                  const SizedBox(height: 12), // Figma'dan gap

                                  // Alt başlık
                                  SizedBox(
                                    width: 190,
                                    height: 17,
                                    child: Text(
                                      AppStrings.loginSubtitle,
                                      style: AppTextStyles.altBaslik,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 36),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [

                              Column(
                                children: [

                                  FigmaInputField(
                                    hintText: AppStrings.emailPlaceholder,
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    validator: validateEmail,
                                    prefixIcon: AuthIcons.email(size: 24),
                                  ),

                                  const SizedBox(height: 16), // Figma'dan gap

                                  FigmaInputField(
                                    hintText: AppStrings.passwordPlaceholder,
                                    controller: _passwordController,
                                    sifreAlani: true,
                                    textInputAction: TextInputAction.done,
                                    validator: validatePassword,
                                    prefixIcon: AuthIcons.lock(size: 24),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 16), // Figma'dan gap

                              FigmaTextButton(
                                text: AppStrings.forgotPassword,
                                onPressed: _sifreUnut,
                              ),
                            ],
                          ),

                          const SizedBox(height: 24), // Figma'dan gap

                          FigmaPrimaryButton(
                            text: AppStrings.login,
                            onPressed: _girisYap,
                            isLoading: _yukleniyor,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Sosyal medya butonları - Figma
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
                        width: 135,
                        height: 22,
                        child: Text(
                          AppStrings.dontHaveAccount,
                          style: AppTextStyles.hesabinYokMu,
                          textAlign: TextAlign.left,
                        ),
                      ),

                      const SizedBox(width: 8),

                      FigmaTextButton(
                        text: AppStrings.register,
                        onPressed: _kayitSayfasi,
                        textStyle: AppTextStyles.kayitOlButon,
                      ),
                    ],
                  ),

                  const SizedBox(height: 32), // Alt boşluk
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
