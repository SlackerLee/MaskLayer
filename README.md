
# MaskLayer
MaskLayer is an app that showcases a variety of photo frame shapes and serves as a collection of UI samples. It experiments with UI output by masking images rather than editing them directly. The photo frame code can be utilized in future projects.

## Features
- Using program to mask the image, not editing the image directly
- Using SwiftUI
- List of different shapes of photo frames
- Light/dark mode 

## Screenshots

Home Page:<br />
<img src="https://github.com/user-attachments/assets/cd7ce0b2-583d-4b38-a712-3d824a89a913" alt="project-screenshot" width="300" height="600/" />
<br />
Photo Frames：<br />
<img src="https://github.com/user-attachments/assets/bb5072a1-6bee-4bde-9dda-c1c54a716604" alt="project-screenshot" width="300" height="600/" />
<img src="https://github.com/user-attachments/assets/7b55dc1d-29cf-40dc-91c0-4da98b636c6b" alt="project-screenshot" width="300" height="600/" />
<img src="https://github.com/user-attachments/assets/ca1f5bc3-f22c-4138-bfb4-fea6fb7fd4b4" alt="project-screenshot" width="300" height="600/" />
<img src="https://github.com/user-attachments/assets/8b763503-1759-42db-a577-1e0c643c474a" alt="project-screenshot" width="300" height="600/" />
<img src="https://github.com/user-attachments/assets/ab8caba9-bd68-42e3-b1dd-38aba0d0a203" alt="project-screenshot" width="300" height="600/" />

## Usage/Examples

```SwiftUi
Image("your_image_name")
            .resizable()
            .clipShape(StarShape())
            .frame(width: 300, height: 300)
            .scaledToFit()
            .overlay(
                StarShape().stroke(Color.white, lineWidth: 2)
            )
            .shadow(radius: 7)
            .padding()
```


## Tech Stack

**Client:** Swift, SwiftUI

## Authors

- [@nicolelee](https://github.com/SlackerLee)

