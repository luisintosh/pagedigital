import * as THREE from 'three';
import VANTA_GLOBE from 'vanta/src/vanta.globe';

console.log('VANTA_GLOBE begin')

VANTA_GLOBE({
    el: "#animation-globe",
    THREE,
    mouseControls: true,
    touchControls: true,
    gyroControls: false,
    minHeight: 200.00,
    minWidth: 200.00,
    scale: 1.00,
    scaleMobile: 1.00,
    color: 0x7d42f4,
    color2: 0x54ffe9,
    backgroundColor: 0xfcfcfc
})

console.log('VANTA_GLOBE started')