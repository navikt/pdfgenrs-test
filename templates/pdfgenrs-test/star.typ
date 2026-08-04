#let data = json("/data/pdfgenrs-test/star.json")
#let title = data.at("title", default: "Star Example")
#let points = int(data.at("points", default: 5))
#let fill_color = rgb(data.at("fillColor", default: "#FFD700"))
#let stroke_color = rgb(data.at("strokeColor", default: "#B8860B"))
#let label = data.at("label", default: "")

#let star_vertices(n, cx, cy, outer, inner) = {
  let vertices = ()
  for i in range(2 * n) {
    let angle = (i * calc.pi / n) - calc.pi / 2
    let r = if calc.rem(i, 2) == 0 { outer } else { inner }
    vertices.push((
      cx + r * calc.cos(angle) * 1pt,
      cy + r * calc.sin(angle) * 1pt,
    ))
  }
  vertices
}

#set document(title: title)
#set page(margin: 2cm)
#set text(font: ("Source Sans 3", "DejaVu Sans"), lang: "nb", size: 12pt)

#align(center)[
  #text(size: 20pt, weight: "bold")[#title]
]

#v(1cm)

#align(center)[
  #box(width: 200pt, height: 200pt)[
    #polygon(
      fill: fill_color,
      stroke: stroke_color + 2pt,
      ..star_vertices(points, 100pt, 100pt, 90, 36),
    )
  ]
]

#v(0.5cm)

#if label != "" {
  align(center)[#text(size: 14pt)[#label]]
}
