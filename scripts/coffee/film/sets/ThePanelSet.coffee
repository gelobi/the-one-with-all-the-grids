Set = require('tiny-filmmaking-studio').Set
Rotator = require './thePanelSet/Rotator'

module.exports = class ThePanelSet extends Set

	constructor: ->

		super

		@id = 'thePanel'

		@film.loader
		.loadImage window.postBase + '/images/thePanel/bg.png', 2276
		.loadImage window.postBase + '/images/thePanel/direction.png', 1030

		@container = @makeSetContainer [12001, 119000]
		.attr 'id', 'thePanel-container'

		@_appendElementOnTime @container, @film.display.stageContainer, [152000, 168000]

		panelHtml = """
		<div style="width: 246px">

		<section>

			<div class="griddify-section">

				<input id="griddify-input" type="text" name="spacing" placeholder="Spacing" class="big">

				<div id="griddify-direction" data-type="rotator" data-options="right, down, left, up" data-name="direction" class="direction"></div>

				<button id="griddify-button" style="width: 54px" class="noMargin">Griddify</button>

			</div>

			<hr>

		</section>

		<section>

			<div class="divide-section">

				<input id="divide-input" type="text" name="divisions" placeholder="Divisions" class="big">

				<div id="divide-orientation" data-type="rotator" data-options="vertical, horizontal, both" data-name="orientation" class="orientation"></div>

				<button id="divide-button" style="width: 54px" class="noMargin">Divide</button>

			</div>

			<hr>


		</section>

		<section>

			<div class="wrap-section">

				<input id="wrap-input" type="text" name="spacing" placeholder="Spacing" class="big">

				<div id="wrap-orientation" data-type="rotator" data-options="vertical, horizontal, both" data-name="orientation" class="orientation"></div>

				<button id="wrap-button" style="width: 54px" class="noMargin">Wrap</button>

			</div>

		</section>

		<script src="./scripts/dist/panel.js"></script>

		</div>
		"""

		@thePanel = @_makeEl '#thePanel.aPanel'
		.inside @container
		.perspective 800

		@panelBody = @_makeEl '.body'
		.html panelHtml

		@_setupDomEl 'The Panel', 'Panel', @thePanel, ['opacity', 'rotationY']

		@griddifySection = @_makeEl @panelBody.node.querySelector '.griddify-section'
		.perspective 800

		@divideSection = @_makeEl @panelBody.node.querySelector '.divide-section'
		.perspective 800

		@wrapSection = @_makeEl @panelBody.node.querySelector '.wrap-section'
		.perspective 800

		@_setupDomEl 'The Panel', 'Griddify Section', @griddifySection, ['z']
		@_setupDomEl 'The Panel', 'Divide Section', @divideSection, ['z']
		@_setupDomEl 'The Panel', 'Wrap Section', @wrapSection, ['z']

		Rotator.applyTo @panelBody.node

		for node in @panelBody.node.querySelectorAll 'button'

			el = @_makeEl node
			.perspective 800

			name = node.innerHTML.replace(/^\s+/, '').replace(/\s+$/, '')

			@_setupDomEl 'The Panel', "Button #{name}", el, ['z', 'rotationY']

		@panelBody.inside @thePanel