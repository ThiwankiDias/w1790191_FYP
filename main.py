# developer: H. Thiwanki Dias Hettiarachchi (UoW id : w1790191)
import os
import flask
from flask import Flask, request, render_template, redirect, send_file, url_for, jsonify
import io
from PIL import Image
import torch
import argparse
import yolov5

app = Flask(__name__, template_folder='D:/FYP/w1790191_full_code/w1790191_backend_api/template',
            static_folder='D:/FYP/w1790191_full_code/w1790191_backend_api/static')

IMG_FOLDER = os.path.join('static', 'images')
app.config['UPLOAD_FOLDER'] = IMG_FOLDER


@app.route("/predict_defects", methods=['GET', 'POST'])
def predict_defects():
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

        return send_file(img_save_name, mimetype='image/jpg')
    return render_template("index1.html")


@app.route("/predict_risks", methods=['GET', 'POST'])
def predict_risks():
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
        return send_file(img_save_name, mimetype='image/jpg')
    return render_template("index2.html")


@app.route("/predict_overall_risk", methods=['GET', 'POST'])
def predict_overall_risk():
    if flask.request.method == 'POST':
        if request.files.get("file"):
            img_file = request.files["file"]
            img_bytes = img_file.read()
            img = Image.open(io.BytesIO(img_bytes))
            results = model_of_defects_risk_detection([img], size=640)
            prediction = results.pandas().xyxy[0]
            if len(prediction) > 0:
                class_names = prediction["name"].tolist()
                risk_order = ["high_risk", "medium_risk", "low_risk"]
                class_names.sort(key=risk_order.index)
                highest_risk = class_names[0]
            else:
                highest_risk = "no risk"
                # results_dict = {"prediction": results.pandas().xyxy[0].to_dict(orient="records")}
                # return flask.jsonify(results_dict)
            return jsonify({"risk_level": highest_risk})
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
