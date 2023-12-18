// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html";
import * as Sentry from "@sentry/browser";
// Establish Phoenix Socket and LiveView configuration.
import anime from "animejs/lib/anime.es";
import * as Ap from "fp-ts/Apply";
import { pipe } from "fp-ts/function";
import * as O from "fp-ts/Option";
import { Socket } from "phoenix";
import { LiveSocket } from "phoenix_live_view";

import topbar from "../vendor/topbar"; // eslint-disable-line import/no-relative-parent-imports
import "./devs";

Sentry.init({
  dsn: "https://47470a77eacae7189d741ec70d78533f@o4505920220692480.ingest.sentry.io/4505920230326272",
  integrations: [new Sentry.BrowserTracing(), new Sentry.Replay()],

  // Set tracesSampleRate to 1.0 to capture 100%
  // of transactions for performance monitoring.
  // We recommend adjusting this value in production
  tracesSampleRate: 1.0,

  // Set `tracePropagationTargets` to control for which URLs distributed tracing should be enabled
  tracePropagationTargets: ["localhost", /^https:\/\/yourserver\.io\/api/],

  // Capture Replay for 10% of all sessions,
  // plus for 100% of sessions with an error
  replaysSessionSampleRate: 0.1,
  replaysOnErrorSampleRate: 1.0,
});

const csrfToken = pipe(
  O.fromNullable(document.querySelector("meta[name='csrf-token']")),
  O.map((el) => el.getAttribute("content")),
  O.getOrElseW(() => null),
);
const liveSocket = new LiveSocket("/live", Socket, { params: { _csrf_token: csrfToken } });

// Show progress bar on live navigation and form submits
topbar.config({ barColors: { 0: "#29d" }, shadowColor: "rgba(0, 0, 0, .3)" });
window.addEventListener("phx:page-loading-start", (_info) => topbar.show(300));
window.addEventListener("phx:page-loading-stop", (_info) => topbar.hide());

// connect if there are any LiveViews on the page
liveSocket.connect();

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()

declare global {
  interface Window {
    liveSocket: LiveSocket;
  }
}

window.liveSocket = liveSocket;

if (!window.matchMedia("prefers-reduced-motion").matches) {
  pipe(
    Ap.sequenceT(O.Apply)(
      O.fromNullable(document.getElementById("path6")),
      O.fromNullable(document.getElementById("path24")),
      O.fromNullable(document.getElementById("path26")),
      O.fromNullable(document.getElementById("path33")),
    ),
    O.map(([path6, path24, path26, path33]) => {
      anime({
        targets: path6,
        translateY: 109,
        direction: "alternate",
        loop: true,
        easing: "cubicBezier(0.65, 0, 0.35, 1)",
        duration: 7500,
      });

      anime({
        targets: path24,
        translateY: 109,
        direction: "alternate",
        loop: true,
        easing: "cubicBezier(0.65, 0, 0.35, 1)",
        duration: 7500,
      });

      anime({
        targets: path26,
        translateY: -109,
        direction: "alternate",
        loop: true,
        easing: "cubicBezier(0.65, 0, 0.35, 1)",
        duration: 7500,
      });

      anime({
        targets: path33,
        translateX: 108.1,
        direction: "alternate",
        loop: true,
        easing: "cubicBezier(0.65, 0, 0.35, 1)",
        duration: 7500,
      });
    }),
  );
}

pipe(
  Ap.sequenceT(O.Apply)(
    O.fromNullable(document.getElementById("nav_btn_open")),
    O.fromNullable(document.getElementById("nav_overlay")),
  ),
  O.map(([btn, overlay]) => {
    btn.addEventListener("click", (_event) => {
      const isExpanded = overlay.getAttribute("aria-expanded");

      if (isExpanded === "false") {
        overlay.setAttribute("aria-expanded", "true");
        overlay.classList.remove("hidden");
        document.body.classList.add("overflow-hidden");
      }
    });
  }),
);

pipe(
  Ap.sequenceT(O.Apply)(
    O.fromNullable(document.getElementById("nav_btn_close")),
    O.fromNullable(document.getElementById("nav_overlay")),
  ),
  O.map(([btn, overlay]) => {
    btn.addEventListener("click", (_event) => {
      const isExpanded = overlay.getAttribute("aria-expanded");

      if (isExpanded === "true") {
        overlay.setAttribute("aria-expanded", "false");
        overlay.classList.add("hidden");
        document.body.classList.remove("overflow-hidden");
      }
    });
  }),
);
