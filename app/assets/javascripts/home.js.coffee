class @Chart
  constructor: (options) ->
    options = $.extend yes, {}, options,
      categories: []
      series: []

    @categories = options.categories
    @series = options.series
    @options = $.extend(yes, {}, Chart.BaseOptions)

  addSeries: (series) ->
    @series.push(series)

  drawInto: (container) ->
    @container = container
    options = $.extend yes, {}, @options,
      chart:
        renderTo: container
      xAxis:
        categories: @categories
      series:
        $.map @series, (serie) -> $.extend yes, serie, {showInLegend: no}
    @chart = new Highcharts.Chart options
    @chart

  redraw: () ->
    @drawInto(@container)

  @BaseOptions =
    chart:
      defaultSeriesType: 'column'
    title:
      text: null
    xAxis:
      labels:
        step: 1
    yAxis:
      title:
        text: null
      allowDecimals: no
      alternateGridColor: '#f0f0f0'
    tooltip:
      crosshairs: true
      shared: true
    margin: [0, 0, 0, 0]
    credits:
      enabled: false
    plotOptions:
      series:
        stacking: 'normal'
