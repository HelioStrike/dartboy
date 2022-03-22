import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'gbops_generator.dart';

Builder gbOpsBuilder(BuilderOptions _) =>
    SharedPartBuilder([GbOpsGenerator()], 'gbops');
