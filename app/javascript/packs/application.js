import "bootstrap";
import "../plugins/flatpickr"
import 'mapbox-gl/dist/mapbox-gl.css';

import { initUpdateNavbarOnScroll } from '../components/navbar';
import { initMapbox } from '../components/home_map';
initUpdateNavbarOnScroll();

initMapbox();
