import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/app_styles/app_styles.dart';
import 'package:qr_code/features/welcome/presentation/cubit/welcome_cubit.dart';
import 'package:qr_code/features/welcome/presentation/cubit/welcome_state.dart';

class WelcomeGate extends StatelessWidget {
  const WelcomeGate({
    super.key,
    required this.employeeNo,
    required this.driverName,
    required this.child,
  });

  final String employeeNo;
  final String driverName;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeCubit()..check(employeeNo),
      child: BlocListener<WelcomeCubit, WelcomeState>(
        listener: (context, state) {
          if (state is WelcomeShow) {
            showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: 'welcome',
              barrierColor: Colors.black54,
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder: (_, _, _) =>
                  WelcomeDialog(name: driverName, daysLeft: state.daysLeft),
            );
          }
        },
        child: child,
      ),
    );
  }
}

class WelcomeDialog extends StatefulWidget {
  const WelcomeDialog({super.key, required this.name, required this.daysLeft});

  final String name;
  final int daysLeft;

  static const String lottieAsset = 'assets/animation/welcome.lottie';

  @override
  State<WelcomeDialog> createState() => _WelcomeDialogState();
}

class _WelcomeDialogState extends State<WelcomeDialog>
    with TickerProviderStateMixin {
  Timer? _timer;

  // Card pops in, then the texts slide up one after the other.
  late final AnimationController _enter = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  )..forward();

  // Loops forever: floating card + waving hand.
  late final AnimationController _wave = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat(reverse: true);

  // Loops forever: confetti falling over the whole screen.
  late final AnimationController _confetti = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat();

  late final Animation<double> _pop = CurvedAnimation(
    parent: _enter,
    curve: const Interval(0, 0.45, curve: Curves.elasticOut),
  );
  late final Animation<double> _title = CurvedAnimation(
    parent: _enter,
    curve: const Interval(0.35, 0.7, curve: Curves.easeOutCubic),
  );
  late final Animation<double> _subtitle = CurvedAnimation(
    parent: _enter,
    curve: const Interval(0.55, 1, curve: Curves.easeOutCubic),
  );
  late final Animation<double> _float =
      CurvedAnimation(parent: _wave, curve: Curves.easeInOut);

  late final List<_Piece> _pieces = _Piece.generate(25);

  @override
  void initState() {
    super.initState();
    // Close by itself; the timer is cancelled in dispose() if he closed it first.
    _timer = Timer(const Duration(milliseconds: 2500), () {
      if (mounted) Navigator.of(context).maybePop();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _enter.dispose();
    _wave.dispose();
    _confetti.dispose();
    super.dispose();
  }

  Widget _slideUp(Animation<double> a, Widget child) => FadeTransition(
        opacity: a,
        child: SlideTransition(
          position:
              Tween(begin: const Offset(0, 0.6), end: Offset.zero).animate(a),
          child: child,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).maybePop(),
        child: Stack(
          children: [
            // Confetti over the whole screen.
            Positioned.fill(
              child: IgnorePointer(
                child: AnimatedBuilder(
                  animation: _confetti,
                  builder: (_, _) => CustomPaint(
                    painter: _ConfettiPainter(_pieces, _confetti.value),
                  ),
                ),
              ),
            ),
            Center(
              child: ScaleTransition(
                scale: _pop,
                child: AnimatedBuilder(
                  animation: _float,
                  builder: (_, child) => Transform.translate(
                    offset: Offset(0, -10 * _float.value),
                    child: child,
                  ),
                  child: _card(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkBlueColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.purpleColor, width: 2),
        boxShadow: [
          BoxShadow(
            color: AppColors.purpleColor.withValues(alpha: 0.5),
            blurRadius: 30,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 150,
            child: Lottie.asset(
              WelcomeDialog.lottieAsset,
              repeat: true,
              errorBuilder: (_, error, _) {
                debugPrint('Welcome lottie failed: $error');
                return Center(
                  child: RotationTransition(
                    turns: Tween(begin: -0.06, end: 0.06).animate(_float),
                    child: const Icon(Icons.waving_hand,
                        size: 80, color: Colors.amber),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          _slideUp(
            _title,
            Text(
              'أهلاً بيك يا ${widget.name} 👋',
              textAlign: TextAlign.center,
              style: AppStyles.bold.copyWith(fontSize: 20),
            ),
          ),
          const SizedBox(height: 6),
          _slideUp(
            _subtitle,
            Text(
              'يسعدنا انضمامك لفريقنا',
              textAlign: TextAlign.center,
              style: AppStyles.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}

class _Piece {
  _Piece({
    required this.x,
    required this.phase,
    required this.cycles,
    required this.size,
    required this.color,
    required this.drift,
    required this.spin,
  });

  final double x; // 0..1 of the screen width
  final double phase; // 0..1 start offset
  final int cycles; // falls per loop (int => seamless loop)
  final double size;
  final Color color;
  final double drift;
  final double spin;

  static const _palette = [
    Color(0xFF7C3AED),
    Color(0xFF00E096),
    Color(0xFFF59E0B),
    Color(0xFFFF6B6B),
    Color(0xFF38BDF8),
    Color(0xFFF5F5F2),
  ];

  static List<_Piece> generate(int n) {
    final r = math.Random(7);
    return List.generate(
      n,
      (_) => _Piece(
        x: r.nextDouble(),
        phase: r.nextDouble(),
        cycles: 1 + r.nextInt(2),
        size: 6 + r.nextDouble() * 8,
        color: _palette[r.nextInt(_palette.length)],
        drift: 10 + r.nextDouble() * 24,
        spin: 2 + r.nextDouble() * 6,
      ),
    );
  }
}

class _ConfettiPainter extends CustomPainter {
  _ConfettiPainter(this.pieces, this.t);

  final List<_Piece> pieces;
  final double t;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    for (final p in pieces) {
      final progress = (t * p.cycles + p.phase) % 1;
      final y = progress * (size.height + 40) - 20;
      final x = p.x * size.width + math.sin(progress * math.pi * 4) * p.drift;
      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(progress * math.pi * p.spin);
      paint.color = p.color;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: Offset.zero, width: p.size, height: p.size * 0.5),
          const Radius.circular(2),
        ),
        paint,
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter old) => old.t != t;
}
