/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct CameraView: View {
    @StateObject private var model = DataModel()
 
    private static let barHeightFactor = 0.15
    var imageView: UIImageView?
    @State var displayStitchedImage: Image?
    
    var body: some View {
        
        NavigationView {
            
            GeometryReader { geometry in
                ViewfinderView(image:  $model.viewfinderImage )
                    .overlay(alignment: .top) {
                        Color.black
                            .opacity(0.75)
                            .frame(height: geometry.size.height * Self.barHeightFactor)
                        displayStitchedImage?.resizable().scaledToFit().frame(width: 400, height: 400, alignment: Alignment.center)
                    }
                    .overlay(alignment: .bottom) {
                        buttonsView()
                            .frame(height: geometry.size.height * Self.barHeightFactor)
                            .background(.black.opacity(0.75))
                    }
                    .overlay(alignment: .center)  {
                        Color.clear
                            .frame(height: geometry.size.height * (1 - (Self.barHeightFactor * 2)))
                            .accessibilityElement()
                            .accessibilityLabel("View Finder")
                            .accessibilityAddTraits([.isImage])
                    }
                    .background(.black)
            }
            .task {
                await model.camera.start()
                await model.loadPhotos()
                await model.loadThumbnail()
            }
            .navigationTitle("Camera")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .ignoresSafeArea()
            .statusBar(hidden: true)
        }
        .navigationViewStyle(.stack)
    }
    
    func stitched() async throws -> UIImage {
          guard
              let image1 = UIImage(named:"1.jpg"),
              let image2 = UIImage(named:"2.jpg"),
//              let image3 = UIImage(named:"3.jpg"),
              let image4 = UIImage(named:"4.jpg")
//              let image5 = UIImage(named:"5.jpg"),
//              let image6 = UIImage(named:"6.jpg"),
//              let image7 = UIImage(named:"7.jpg"),
//              let image8 = UIImage(named:"8.jpg")
          else {
              let error = NSError.init(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "couldn't create input images"])
              throw error
          }
          let images:[UIImage] = [image1,image2, image4]
          let stitchedImage:UIImage = try OpenCVWrapper.stitchingImagesCPP(images)
          return stitchedImage
      }
    
    func displayImage(image: UIImage) {
        displayStitchedImage = Image(uiImage: image);
    }
    
    private func buttonsView() -> some View {
        HStack(spacing: 60) {
            
            Spacer()
            
            NavigationLink {
                PhotoCollectionView(photoCollection: model.photoCollection)
                    .onAppear {
                        model.camera.isPreviewPaused = true
                    }
                    .onDisappear {
                        model.camera.isPreviewPaused = false
                    }
            } label: {
                Label {
                    Text("Gallery")
                } icon: {
                    ThumbnailView(image: model.thumbnailImage)
                }
            }
            
            Button {
                model.camera.takePhoto()
            } label: {
                Label {
                    Text("Take Photo")
                } icon: {
                    ZStack {
                        Circle()
                            .strokeBorder(.white, lineWidth: 3)
                            .frame(width: 62, height: 62)
                        Circle()
                            .fill(.white)
                            .frame(width: 50, height: 50)
                    }
                }
            }
            
            Button {
                model.camera.switchCaptureDevice()
            } label: {
                Label("Switch Camera", systemImage: "arrow.triangle.2.circlepath")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)
            }
            
            Button {
                Task {
                    let image = try await stitched();
                    
                    displayImage(image: image);
                }
            } label: {
                Label {
                    
                } icon: {
                    ZStack {
                        Circle()
                            .strokeBorder(.red, lineWidth: 3)
                            .frame(width: 62, height: 62)
                        Circle()
                            .fill(.red)
                            .frame(width: 50, height: 50)
                    }
                }
            }
            
            Spacer()
        
        }
        .buttonStyle(.plain)
        .labelStyle(.iconOnly)
        .padding()
    }
    
}
