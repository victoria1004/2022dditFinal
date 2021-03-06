<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="https://cdn.jsdelivr.net/npm/gantt-schedule-timeline-calendar/dist/gstc.wasm.umd.min.js"></script>

<link rel="stylesheet" href="/resources/gantt-schedule-timeline-calendar/dist/style.css" />
<link rel="stylesheet" href="/resources/gantt-schedule-timeline-calendar/dist/reset.css" />
<br><br><br><br>
<style>
  .gstc__chart-timeline-items-row-item {
    border-radius: 4px;
  }
  .overlay {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
    background: #ffffff80;
    text-align: center;
    padding-top: 20px;
  }
  .row-content-wrapper .row-content{
  	font-size: 1.2em;
  }
  .item-label{
  	font-size: 1em;
  }
  .tool-shelf .form-control{
  	height: 35px;
  }
</style>
<div class="layout-px-spacing">
<div class="statbox widget box box-shadow" >
<div class="widget-header">
<div id="gstc"></div>
</div></div></div>
<script type="module" src="/resources/gantt-schedule-timeline-calendar/examples/one-month/index.js"></script>
