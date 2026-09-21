#set page(
  margin: (top: 0.6in, bottom: 0.6in, left: 0.5in, right: 0.5in)
)
#set text(size: 10pt)

// Bold section headings
#show heading.where(level: 1): it => {
  set text(weight: "bold")
  it
}

// Name header
= {{NAME}}

+852 9123 4567 | tony.cheung at connect.ust.hk | linkedin.com/in/tonycheung | github.com/tonycheung

*Right to work in Hong Kong, open to relocation*