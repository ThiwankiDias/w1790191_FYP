# developer: H. Thiwanki Dias Hettiarachchi (UoW id : w1790191)
# used python version for the project = 3.7.2

import os
from flask import Flask, request, render_template, redirect, send_file, url_for, jsonify
import io
from PIL import Image
import torch
import yolov5

app = Flask(__name__, template_folder='D:/FYP/w1790191_full_code/w1790191_backend_api/template',
            static_folder='D:/FYP/w1790191_full_code/w1790191_backend_api/static')

IMG_FOLDER = os.path.join('static', 'images')
app.config['UPLOAD_FOLDER'] = IMG_FOLDER


@app.route("/predict_defects", methods=['GET', 'POST'])
def predict_defects():
    # check whether the request.method is POST
    if request.method == 'POST':
        if "file" not in request.files:
            return redirect(request.url)
        file = request.files["file"]
        if not file:
            return
        img_bytes = file.read()
        img = Image.open(io.BytesIO(img_bytes))
        results = model_of_defects_detection([img])
        results.render()[0]
        img_save_name = f"D:/FYP/w1790191_full_code/w1790191_backend_api/static/images/pred_defects_image.jpg"
        Image.fromarray(results.ims[0]).save(img_save_name)  # save the predicted image.

        return send_file(img_save_name, mimetype='image/jpg')  # return the response (predicted saved image) to the user
    # if the request.method is GET
    return render_template("index1.html")


@app.route("/predict_risks", methods=['GET', 'POST'])
def predict_risks():
    # check whether the request.method is POST
    if request.method == 'POST':
        if "file" not in request.files:
            return redirect(request.url)
        file = request.files["file"]
        if not file:
            return
        img_bytes = file.read()
        img = Image.open(io.BytesIO(img_bytes))
        results = model_of_defects_risk_detection([img])
        results.render()[0]
        img_save_name = f"D:/FYP/w1790191_full_code/w1790191_backend_api/static/images/pred_defects_risks_image.jpg"
        Image.fromarray(results.ims[0]).save(img_save_name)  # save the predicted image.
        return send_file(img_save_name, mimetype='image/jpg') # return the response (predicted saved image) to the user
    # if the request.method is GET
    return render_template("index2.html")


@app.route("/predict_overall_risk", methods=['GET', 'POST'])
def predict_overall_risk():
    # check whether the request.method is POST
    if request.method == 'POST':
        if request.files.get("file"):
            img_file = request.files["file"]
            img_bytes = img_file.read()
            img = Image.open(io.BytesIO(img_bytes))
            results = model_of_defects_risk_detection([img], size=640)
            prediction = results.pandas().xyxy[0]
            if len(prediction) > 0:
                # extract the list of detected class names from the prediction
                class_names = prediction["name"].tolist()
                # defined the order
                risk_order = ["high_risk", "medium_risk", "low_risk"]
                # sort the class names according to the above defined order
                class_names.sort(key=risk_order.index)
                highest_risk = class_names[0] # risk level of the defective tyre
            else:
                # if there are not any detected risk levels in image (if the tyre is not defective) the risk level of
                # the defective tyre assigned to "no risk"
                highest_risk = "no risk"
                # results_dict = {"prediction": results.pandas().xyxy[0].to_dict(orient="records")}
                # return flask.jsonify(results_dict)
            return jsonify({"risk_level": highest_risk})
    # if the request.method is GET
    return render_template("index3.html")


if __name__ == "__main__":
    model_of_defects_detection = torch.hub.load('ultralytics/yolov5', 'custom',
                                                'D:/FYP/w1790191_full_code/w1790191_backend_api/models'
                                                '/defect_detection/best.pt')

    model_of_defects_risk_detection = torch.hub.load('ultralytics/yolov5', 'custom',
                                                     'D:/FYP/w1790191_full_code/w1790191_backend_api/models'
                                                     '/risks_detection/best.pt')
    app.run(host='0.0.0.0', debug=True)  # make the server publicly available with the same network after run this
    # application
