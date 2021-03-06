//
//  ArticlesSearchBarDelegate
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

final class ArticlesSearchBarDelegate: NSObject, UISearchBarDelegate {
  
private weak var viewModel: ArticlesViewModel?
  
init(viewModel: ArticlesViewModel) {
  self.viewModel = viewModel
}

func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
  viewModel?.search(query: searchBar.text!)
}
  
} // class ArticlesSearchBarDelegate
