import suanpan
from suanpan.app import app
from suanpan.app.arguments import String


@app.input(String(key="inputData1"))
@app.output(String(key="outputData1"))
def HelloWorld(context):
    args = context.args

    # 在此处编辑用户自定义代码

    return "Hello World!"


if __name__ == "__main__":
    suanpan.run(app)
