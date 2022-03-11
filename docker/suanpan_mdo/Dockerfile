ARG PYTHON_VERSION=3.7

FROM registry-vpc.cn-shanghai.aliyuncs.com/shuzhi-amd64/suanpan-python-sdk:${PYTHON_VERSION} as builder

ENV PYPI_MIRROR "https://mirrors.aliyun.com/pypi/simple"

RUN pip config set global.index-url ${PYPI_MIRROR}

RUN pip install --upgrade pip

RUN pip install --no-cache-dir pyarmor

WORKDIR /build

COPY . /build

RUN bash tools/compress.sh

FROM registry-vpc.cn-shanghai.aliyuncs.com/shuzhi-amd64/suanpan-python-sdk:${PYTHON_VERSION}

WORKDIR /demos

ENV PYPI_MIRROR "https://mirrors.aliyun.com/pypi/simple"

RUN pip config set global.index-url ${PYPI_MIRROR}

RUN pip install --upgrade pip

COPY requirements.txt /demos

RUN pip install -r requirements.txt

COPY --from=builder /build/dist /demos

RUN rm -rf /demos/components/packages/tests/

RUN python -c "import suanpan;print(f'suanpan.__version__: {suanpan.__version__}')"
# RUN pip freeze | grep suanpan

ENTRYPOINT [ "/sbin/my_init", "--" ]

ENV TZ=Asia/Shanghai

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

CMD [ "bash" ]
