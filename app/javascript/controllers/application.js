import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

// slide_panel
import './stylesheets/slide_panel.css';

// Monaco Editor
import * as monaco from 'monaco-editor';

window.onload = function() {
    const editor = monaco.editor.create(document.getElementById('container'), {
        value: "function hello() {\n\talert('Hello, world!');\n}",
        language: "javascript"
    });
};