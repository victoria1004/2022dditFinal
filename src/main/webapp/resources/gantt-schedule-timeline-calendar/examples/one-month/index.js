import GSTC from '../../dist/gstc.esm.min.js';
// or when you encounter problems with wasm loader
// import GSTC from '../../dist/gstc.wasm.esm.min.js';
import { Plugin as TimelinePointer } from '../../dist/plugins/timeline-pointer.esm.min.js';
import { Plugin as Selection } from '../../dist/plugins/selection.esm.min.js';
import { Plugin as ItemMovement } from '../../dist/plugins/item-movement.esm.min.js';
import { Plugin as ItemResizing } from '../../dist/plugins/item-resizing.esm.min.js';
import { Plugin as CalendarScroll } from '../../dist/plugins/calendar-scroll.esm.min.js';
import { Plugin as HighlightWeekends } from '../../dist/plugins/highlight-weekends.esm.min.js';
import { Plugin as ProgressBar } from '../../dist/plugins/progress-bar.esm.min.js';
import { Plugin as TimeBookmarks } from '../../dist/plugins/time-bookmarks.esm.min.js';
import { Plugin as DependencyLines } from '../../dist/plugins/dependency-lines.esm.min.js';
 
const iterations = 100;
const GSTCID = GSTC.api.GSTCID;

function getRandomFaceImage() {
  return `/resources/gantt-schedule-timeline-calendar/examples/one-month/faces/face-${Math.ceil(Math.random() * 50)}.jpg`;
}

const colors = ['#E74C3C', '#DA3C78', '#7E349D', '#0077C0', '#07ABA0', '#0EAC51', '#F1892D'];
function getRandomColor() {
  return colors[Math.floor(Math.random() * colors.length)];
}
globalThis.GSTC = GSTC;

const startDate = GSTC.api.date('2022-04-01').startOf('month');
const endDate = startDate.clone().endOf('month');
const startTime = startDate.valueOf();

/**
 * @type {import('../../dist/gstc').Rows}
 */
 
const rows = {};
const items = {};
	$.ajax({
		url: "/project/todoList",
		type: "post",
		async: false,
		success: function(res){
			$.each(res, function(i, v){
				var withParent = false;
				if(v.TD_PARENT != null){ 
					withParent = true ;
				}
			const id = GSTCID(String(v.TD_NO));
				rows[id] = {
					id,
					label: v.TD_TTL, 
					parentId: withParent ? GSTCID(String(v.TD_PARENT)) : undefined,
					expanded: false,
					progress: v.PRGRS + "%" ,
				};
				let rowId = GSTCID((v.TD_NO).toString());
				let startDayjs = GSTC.api
				    .date(GSTC.api.date(v.TD_STRT_DT).startOf('month').valueOf())
				    .startOf('month')
				    .add(parseInt(v.TD_STRT_DT.substr(8)) - 1, 'day');
				let endDayjs = GSTC.api
				    .date(GSTC.api.date(v.TD_END_DT).startOf('month').valueOf())
				    .startOf('month')
				    .add(parseInt(v.TD_END_DT.substr(8)) - 1, 'day');
				items[id] = {
				    id,
				    label: v.TD_TTL,
				    progress: v.PRGRS,
				   style: { background: getRandomColor() },
				    time: {
				    start: startDayjs.startOf('day').valueOf(),
				    end: endDayjs.startOf('day').valueOf(),
				    },
				    rowId,
				    img: '/resources/profileImage/' + v.MBR_IMG,
				 }
			})
		}
	})




const columns = {
  data: {
    [GSTCID('id')]: {
      id: GSTCID('id'),
      data: ({ row }) => GSTC.api.sourceID(row.id),
      width: 80,
      sortable: ({ row }) => Number(GSTC.api.sourceID(row.id)),
      header: {
        content: 'ID',
      },
    },
    [GSTCID('label')]: {
      id: GSTCID('label'),
      data: 'label',
      sortable: 'label',
      expander: true,
      isHTML: false,
      width: 250,
      header: {
        content: 'Label',
      },
    },
    [GSTCID('progress')]: {
      id: GSTCID('progress'),
      data({ row, vido }) {
        return vido.html`<div style="text-align:center">${row.progress}</div>`;
      },
      width: 80,
      sortable: 'progress',
      header: {
        content: 'Progress',
      },
    },
  },
};


function itemSlot(vido, props) {
  const { html, onChange, update } = vido;

  let imageSrc = '';
  let description = '';
  onChange((newProps) => {
    props = newProps;
    if (!props || !props.item) return;
    imageSrc = props.item.img;
    description = props.item.description;
    update();
  });

  return (content) => {
    if (!props || !props.item) return content;
    return html`<div
        class="item-image"
        style="background:url(${imageSrc}),transparent;flex-shrink:0;border-radius:100%;width:34px;height:34px;vertical-align: middle;background-size: 100%;margin: 4px 11px 0px 0px;"
      ></div>
      <div class="item-text">
        <div class="item-label">${content}</div>
        <div class="item-description" style="font-size:11px;margin-top:2px;color:#fffffff0;line-height:1em;">
          ${description}
        </div>
      </div>`;
  };
}

function rowSlot(vido, props) {
  const { html, onChange, update, api } = vido;

  let img = '';
  onChange((newProps) => {
    props = newProps;
    if (!props || !props.row) return;
    img = props.row.img;
    update();
  });

  return (content) => {
    if (!props || !props.column) return;
    return api.sourceID(props.column.id) === 'label'
      ? html`<div class="row-content-wrapper" style="display:flex">
          <div class="row-content" style="flex-grow:1;">${content}</div>
        </div>`
      : content;
  };
}

function mainOuterSlot(vido, props) {
  const { onChange, api, update, html, state, getElement } = vido;

  onChange((changedProps) => {
    // if current element is reused to display other item data just update your data so when you click you will display right alert
    props = changedProps;
  });

  let year = api.time.date(startTime).year();
  let month = api.time.date(startTime).month();
  const months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  let loading = '';
  let overlay = '';

  function updateTime() {
    if (loading) return;
    const startTime = api.time
      .date(`${year}-${month + 1}-01`)
      .startOf('month')
      .valueOf();
    const endTime = api.time
      .date(`${year}-${month + 1}-01`)
      .endOf('month')
      .valueOf();
    loading = 'LOADING... You can load items from backend now.';
    overlay = 'overlay';
    setTimeout(() => {
      // if you have items you can change view
      state.update('config.chart.time', (time) => {
        time.from = startTime;
        time.to = endTime;
        console.log(`${year}-${month + 1}-01`, `${year}-${month + 1}-01`);
        return time;
      });
      loading = '';
      overlay = '';
    }, 250);
  }

  let listenerAdded = false;
  function getEl(element) {
    if (listenerAdded) return;
    element.addEventListener('change', (ev) => {
      if (month !== ev.target.value) {
        month = Number(ev.target.value);
        updateTime();
        update();
      }
    });
    listenerAdded = true;
  }

  function setPrevYear() {
    if (loading) return;
    year -= 1;
    updateTime();
    update();
  }

  function setNextYear() {
    if (loading) return;
    year += 1;
    updateTime();
    update();
  }

  function setPrevMonth() {
    if (loading) return;
    month -= 1;
    if (month < 0) {
      month = 11;
      year--;
    }
    updateTime();
    update();
  }

  function setNextMonth() {
    if (loading) return;
    month += 1;
    if (month > 11) {
      month = 0;
      year++;
    }
    updateTime();
    update();
  }

  // return render function
  return (content) =>
    html`<div class="tool-shelf" style="margin:20px;">
      Year: &nbsp;&nbsp;<button style="margin-right:5px;" class="btn-outline-primary" @click=${setPrevYear}><</button><input type="number" class="form-control" style="width: 200px; display: inline-block;" .value=${year}><button style="margin-left:5px;" class="btn-outline-primary" @click=${setNextYear}>></button>
      &nbsp&nbsp&nbspMonth: &nbsp;&nbsp;<button id="btn-prev-month" class="btn-outline-primary" style="margin-right:5px;" @click=${setPrevMonth}><</button><select get-element=${getElement(
      getEl
    )}>${months.map(
      (monthText, index) => html`<option value=${index} ?selected=${index === month}>${monthText}</option>`
    )}</option></select><button id="btn-next-month" class="btn-outline-primary" style="margin-left:5px;" @click=${setNextMonth}>></button>
    </div>${content}<div class=${overlay}>${loading}</div>`;
}

const config = {
  licenseKey:
    '====BEGIN LICENSE KEY====\nK1BWU9rmw6ew6eoX1AfyYBhdQA4J27re2CN6bJdE2zxAGcewwdtyvz8R/6+bU2M59qiRgGip6pUrkxcQvbOHOQRe03JCs4JsCB4Gl8bIWy3eB87PG/cHtabmG1qG1ypn2pPgozXZo0y5d724Xx4rtt/0YXZskbEcHAHXbRurcYUuAcO71Tg/mJ2Vk48S3jLA5/ZSitL4IAqleWNzkAsreCSBojALfDGdBWFj0jbHaH/rHZC/IwTgG8xRC2j26WUpPm5t4QExWta+2SbNZwQDi4LITv0nOhDJmjpWiFYJiAsywHKdjdYS15VBBzPaS3xE/ia3NAImuceqswE7Q+VkMw==||U2FsdGVkX1/cbTGfIZEJELofuFc5G9l1uAbwFKzwaYfCckajjkdApws3eGXljjeomwRzums/ZeEKJqA1A0CSAMBk7KFmw7FTQofou8LGQ5U=\nc9ySfe9kz7bTXste649UdvJTNQ/zymuNSw2C90k6WjBLkmcN48nWJpzzrl2pJNpg3ABRAXgG+Bei2A+SoJl+RCKxT5MTyFULRWPrDeNOpCt/IIpiqY6fGmpU4tB0zJr2dmEKkoBvuvBk8Jrpvn2ipjeNaN8WSE3PD6mw8Z+kSzybVqH+Xrs9D9tz0AxWbQrApQEFHyhs/gaoCJN1sewOUXDFC1xag1xUbid63Jog1A0TOjIeBW3JD0eX3zSdHht605bHCZEUbvLMjuSLV/f9Yns7FB/OxVULwijCSqcrxvsKfMG9ve6k82vONdIPyaPOFJ0wyelLhdu480tt5u/Tzw==\n====END LICENSE KEY====',
  innerHeight: 500,
  plugins: [
    HighlightWeekends(),
    TimelinePointer(), // timeline pointer must go first before selection, resizing and movement
    Selection(),
    ItemResizing(), // resizing must fo before movement
    ItemMovement(),
    CalendarScroll(),
    ProgressBar(),
    DependencyLines({
      onLine: [
        (line) => {
          line.type = GSTC.api.sourceID(line.fromItem.id) === '3' ? 'smooth' : 'square';
          return line;
        },
      ],
    }),
  ],
  list: {
    row: {
      height: 58,
    },
    rows,
    columns,
  },
  chart: {
    time: {
      calculatedZoomMode: true,
      from: startDate.valueOf(),
      to: endDate.valueOf(),
    },
    item: {
      height: 50,
    },
    items,
  },
  scroll: {
    vertical: { precise: true },
  },
  slots: {
    'chart-timeline-items-row-item': { content: [itemSlot] },
    'list-column-row': { content: [rowSlot] },
    main: { outer: [mainOuterSlot] },
  }
};

console.log(config.chart.time.from, config.chart.time.to);

let gstc;
let state = GSTC.api.stateFromConfig(config);
(async function mountGSTC() {
  const element = document.getElementById('gstc');

  gstc = GSTC({
    element,
    state,
  });

  //@ts-ignore
  globalThis.state = state;
  //@ts-ignore
  globalThis.gstc = gstc;
})();
