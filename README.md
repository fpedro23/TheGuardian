# The Guardian

Simple, VIPER based iOS Application for fetching and displaying articles from theguardian.com

## Getting Started

Clone the project and open NewsApp.xcworkspace, no need to run pod install.

## VIPER-module structure

From: https://www.objc.io/issues/13-architecture/viper/

- **View:** : displays what it is told to by the Presenter and relays user input back to the Presenter.
- **Interactor** : contains the business logic as specified by a use case.
- **Presenter** : contains view logic for preparing content for display (as received from the Interactor) and for reacting to user inputs (by requesting new data from the Interactor).
- **Entity** : contains basic model objects used by the Interactor.
- **Routing** : contains navigation logic for describing which screens are shown in which order.
- **Services** : contains persistence or networking logic. 

## External Libraries

* DZNEmptyDataSet
* Alamofire

