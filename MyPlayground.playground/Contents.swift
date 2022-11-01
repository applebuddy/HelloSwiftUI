
import SwiftUI
import PlaygroundSupport

// MARK: - GridView
// reference : https://seons-dev.tistory.com/entry/SwiftUI-Grid
// Grid는 List와 친척이라고 할 수 있다.
// List는 일반적으로 Vertical Direction으로 목록을 나타내 준다고 볼 수 있다. 가장 많이 사용되는 View이다.
// List와 반대로 Grid는 horizontal direction으로 뷰를 배치하며 화면을 구성하기 좋다.

struct ContentView: View {
  // 목록을 1부터 1000까지 만듦
  let data = Array(1...1000).map { "목록 \($0)" }
  // 화면을 그리드형식으로 꽉채워줌
  let columns = [
    // 최소 사이즈를 100으로, 화면을 grid 형식으로 꽉차게 구성
    GridItem(.adaptive(minimum: 100))
  ]
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 20) {
        ForEach(data, id: \.self) { value in
          Text(value)
        }
      }
      .padding(.horizontal)
    }
  }
}

let hostingViewController = UIHostingController(rootView: ContentView())
PlaygroundPage.current.liveView = hostingViewController
