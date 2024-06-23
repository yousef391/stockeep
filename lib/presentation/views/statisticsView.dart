import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stockeep/const.dart';
import 'package:stockeep/presentation/cubit/cubit/auth_cubit.dart';
import 'package:stockeep/presentation/cubit/cubit/get_stati_cubit.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StaticsView extends StatefulWidget {
  StaticsView({super.key});

  @override
  State<StaticsView> createState() => _StaticsViewState();
}

class _StaticsViewState extends State<StaticsView> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  
  

  @override
  void initState() {
    data = [
      _ChartData('descharge', 7),
      _ChartData('Supply', 3),
     
  
    ];

    _tooltip = TooltipBehavior(enable: true);
     BlocProvider.of<GetStatiCubit>(context).getdata(
                                BlocProvider.of<AuthCubit>(context).user!.token,
                                BlocProvider.of<AuthCubit>(context)
                                    .user!
                                    .id
                                    .toString());
    super.initState();
  }

  Widget build(BuildContext context) {
    final List<ChartData> chartData = [];
    return BlocConsumer<GetStatiCubit, GetStatiState>(
      listener: (context, state) {
        
        if(state is GetStatisucces) {
          
         
state.stati.forEach((key,value) {
 chartData.add(ChartData(key, value.toDouble()));
});
          
     
        }
      },
      builder: (context, state) {
        if (state is GetStatisucces) {
  return ListView(
    children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: SfCircularChart(
            legend: Legend(
              
              orientation: LegendItemOrientation.vertical,
                textStyle: GoogleFonts.poppins().copyWith(
                  overflow: TextOverflow.ellipsis,
                    fontSize: 12, fontWeight: FontWeight.bold),
                isVisible: true,
                iconHeight: 15,
                iconWidth: 15,
                isResponsive: true,
                overflowMode: LegendItemOverflowMode.wrap,
                position: LegendPosition.bottom),
            title: ChartTitle(
              text: 'BCI Statis chart',
              textStyle: GoogleFonts.poppins().copyWith(
                  fontSize: 12, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.zero,
            tooltipBehavior: _tooltip,
            series: <CircularSeries<ChartData, String>>[
              DoughnutSeries<ChartData, String>(
                  dataLabelMapper: (datum, index) => datum.x,
                  radius: '60%',
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  name: 'Gold')
            ]),
      ),
      SizedBox(
        height: 6,
      ),
      SfCartesianChart(
          title: ChartTitle(
            text: 'BCI requests in this Year ',
            textStyle: GoogleFonts.poppins()
                .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          primaryXAxis: CategoryAxis(
            name: 'type',
          ),
          primaryYAxis:
              NumericAxis(minimum: 0, maximum: 10, interval: 1),
          tooltipBehavior: _tooltip,
          series: <CartesianSeries<_ChartData, String>>[
            ColumnSeries<_ChartData, String>(
                dataSource: data,
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y,
                name: 'BCI orders',
                color: primarycolor)
          ]),
      SizedBox(
        height: 80,
      )
    ],
  );
} else {
 return Center(
              child: Center(
                child: LoadingAnimationWidget.dotsTriangle(
                  color: Color(0xff2185D5),
                  size: 80,
                ),
              ),
          );
}
      },
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
