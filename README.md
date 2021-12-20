# Sign-Language-Translator
**Project Document**

**by Visible Sound**

**Team Members: Qiao Wang, Salma Elmahallawy and Yiding Yuan**

**Project Statement**

Our goal is to use indigenous perspectives and ethical methodologies to build AI tools with gesture-based interfaces. Our application will be a sign language translator.

**Stakeholders**

Our user will be a sign language learner and non-user, ultimately to help them understand and learn sign languages while communicating with sign language users or deaf people, ultimately among the indigenous people.

**List of Objectives**

- Take a real time Plains sign language image and translate it to its equivalent meaning in English
- Potentially, the app can also translate Plains sign language to American sign language

**Criteria &amp; Metrics:**  **how to measure success, how to express yourself, etc**

- Classification accuracy
- Curve fitting (model not overfitting or underfitting)
- Ability to use transfer learning to classify Plains Sign Language instead of ASL
- User friendly application integrated for better application of the project

**Things to look at for ethics analysis**

- Data accuracy
- Preserving the Plains Sign Language as part of their culture
- Protect User privacy by erasing the uploaded images after translation

**Constraints/Limitations**

- Limited memory provided by Google Colab, so implementation must be as efficient as possible
- No lakota sign language data sets/ very small data sets found. Transfer learning will be used after training our model to learn features from ASL datasets.

**Medium**

- OpenCV: for changing dataset images from BRG to grayscale
- Tensorflow Keras for the model
- Flutter for a cross-platform application that can be used as a mobile app or on the web.

**Technical details: datasets, data preprocessing, models, platform development tools, etc.**

- **Necessary Material :**

camera to collect real time sign language images that are to be translated.

- **Initial Dataset (using ASL for training the model):**

[https://www.kaggle.com/belalelwikel/asl-and-some-words](https://www.kaggle.com/belalelwikel/asl-and-some-words)

- **Plains Sign Language Dataset**

[https://plainsindiansignlanguage.files.wordpress.com/2020/03/indiansignlanguage-by-wm-tomkins-1.pdf](https://plainsindiansignlanguage.files.wordpress.com/2020/03/indiansignlanguage-by-wm-tomkins-1.pdf)

- **Data processing:** open cv, numpy and tensorflow

https://colab.research.google.com/drive/1GyIX0ndDLALmEolNQh\_Scqjr4iByaMUM#scrollTo=8\_aDQMUYXMfM

- **Initial Model** : using Keras CNNs

[https://colab.research.google.com/drive/1TGvLWQfuPnTjDaRWlc1qI04NjMFTFG6d#scrollTo=P8nQdKObpYLc&amp;uniqifier=1](https://colab.research.google.com/drive/1TGvLWQfuPnTjDaRWlc1qI04NjMFTFG6d#scrollTo=P8nQdKObpYLc&amp;uniqifier=1)

- **Testing Model**

[https://colab.research.google.com/drive/1moO6h9qK17n8k64bdZgWJN\_h4jaOGUdu#revisionId=0B\_snrsg9YQp1TDB3WWZHRlVwdml5eXU2OHFuSGNCMmF0OFJFPQ&amp;scrollTo=ca3dsqfeMADj](https://colab.research.google.com/drive/1moO6h9qK17n8k64bdZgWJN_h4jaOGUdu#revisionId=0B_snrsg9YQp1TDB3WWZHRlVwdml5eXU2OHFuSGNCMmF0OFJFPQ&amp;scrollTo=ca3dsqfeMADj)

[https://colab.research.google.com/drive/1k2BbeNVXTBwgq58YMoy5AL72vNo9Lrqj](https://colab.research.google.com/drive/1k2BbeNVXTBwgq58YMoy5AL72vNo9Lrqj)

![](RackMultipart20211220-4-1fcuzah_html_65487684f3c16223.png)

The model consists of three Convolutional Neural Network layers that are flattened and followed by another three dense layers. As you can see in the figure the first CNN layer has 16 filters that it has to learn, and it doubles in each layer up to 128 filters. We use &quot;same&quot; padding to preserve the spatial dimensions of the volume such that the output volume size matches the input volume size. Between every CNN 2D layer, we do max pooling to extract only the most important features and reduce the spatial dimensions of the output volume.

After the last max pooling layer we flatten our CNN outputs which gives us an initial layer having 3965184 nodes, which is followed by a layer of 256,128,64 before mapping to the final 51 classes and classifying the image.

- **Flutter:** a multi-platform development tool

convert h5 format to TFlite

https://colab.research.google.com/drive/1piw0dicCclT76aOrQF7YOnz1nDeI0hci

**Results**

One of the test datasets had 42 out of 51 accurately classified, which is almost 82.35% . Another dataset was created by Qiao by taking images for all 51 classes, and the results were a bit lower. Only 20 over 51, which is approximately 39%, were right.

The application was fully implemented, and it was able to select a picture from the device or take a real-time image.

**Next steps**

First we would like to fully integrate the model and the application. In the future, we would also like to look into transfer learning to add an option for translating the Lakota sign language for a more inclusive app.

**Conclusion**

**References**

[https://www.nidcd.nih.gov/health/american-sign-language](https://www.nidcd.nih.gov/health/american-sign-language)

[https://www.startasl.com/american-sign-language/](https://www.startasl.com/american-sign-language/)

[https://en.wikipedia.org/wiki/Plains\_Indian\_Sign\_Language](https://en.wikipedia.org/wiki/Plains_Indian_Sign_Language)

[https://www.kaggle.com/belalelwikel/asl-and-some-words?select=ASL](https://www.kaggle.com/belalelwikel/asl-and-some-words?select=ASL)

[https://www.tensorflow.org/tutorials/images/cnn](https://www.tensorflow.org/tutorials/images/cnn)

[https://www.tensorflow.org/tutorials/images/classification](https://www.tensorflow.org/tutorials/images/classification)

[https://stackoverflow.com/questions/42763094/how-to-save-final-model-using-keras](https://stackoverflow.com/questions/42763094/how-to-save-final-model-using-keras)

[https://flutter.dev/gclid=CjwKCAjw3riIBhAwEiwAzD3TiVbjMw8AN4ZQWED1xwgrPgksmJBVpbqqYki5DYfNvd7hCDWiV0RrIRoC5gYQAvD\_BwE&amp;gclsrc=aw.ds](https://flutter.dev/gclid=CjwKCAjw3riIBhAwEiwAzD3TiVbjMw8AN4ZQWED1xwgrPgksmJBVpbqqYki5DYfNvd7hCDWiV0RrIRoC5gYQAvD_BwE&amp;gclsrc=aw.ds)

https://www.tensorflow.org/lite/convert