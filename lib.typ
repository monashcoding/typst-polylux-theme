#import "@preview/polylux:0.3.1": polylux-slide

#let mac-purple = rgb("#5757d3")

#let margin = 40pt
#let mac-theme(aspect-ratio: "16-9", body) = {
	set page(paper: "presentation-" + aspect-ratio, margin: margin)

	set text(font: "Poppins", size: 25pt)
	set strong(delta: 200)
	show heading: it => if it.level == 3 { text(weight: "semibold", it) } else { it }
	show raw: set text(font: "Fira Code")

	body
}

#let title-slide(title: [], subtitle: [], author: []) = {
	polylux-slide[
		#place(top + left, dx: -margin, dy: -margin, image("img/bg-1.png", width: 100%))
		#place(bottom + right, dx: margin, dy: margin, image("img/bg-2.png", width: 100%))

		#set align(center + horizon)
		#image("img/mac-logo-text.png", width: 25%)
		#v(-1em)
		#text(2em, strong(title)) \

		#text(.75em, weight: "light", tracking: 3pt, upper(subtitle))
		#v(1em)
		#text(.75em, author)
	]
}

#let slide(title: [], body) = {
	polylux-slide({
		box(
			inset: (y: 25pt),
			underline(
				stroke: 4pt + mac-purple,
				offset: 20pt,
				text(mac-purple, strong(title))
			)
		)
		body
		place(bottom + right, image("img/mac-logo.png", height: 50pt))
	})
}
