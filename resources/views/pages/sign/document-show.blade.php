<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>E-Signature | Eye System</title>
    <link rel="icon" type="image/x-icon" href="{{ asset('/') }}assets/img/favicon/favicon.ico" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{ asset('/') }}assets/vendor/fonts/fontawesome.css" />
    <link rel="stylesheet" href="{{ asset('/') }}assets/vendor/fonts/tabler-icons.css" />
    <link rel="stylesheet" href="{{ asset('/') }}assets/vendor/fonts/flag-icons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="{{ asset('/') }}assets/vendor/css/rtl/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="{{ asset('/') }}assets/vendor/css/rtl/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="{{ asset('/') }}assets/css/demo.css" />
    <style>
        canvas {
            border: 1px solid rgb(219, 218, 222);
            border-radius: 6px;
        }
        .annotation {
            position: absolute;
            border: 1px solid #333;
            cursor: move;
            user-select: none;
        }
        @media screen and (min-width: 992px){
            .md-w-50{
                width: 50%
            }
        }
        @media screen and (min-width: 768px) and (max-width: 993px){
            .md-w-50{
                width: 75%
            }
        }
    </style>

</head>
<body class="d-flex justify-content-center">
    <div class="md-w-50">
        <div class="container my-md-5 my-3" id="container-body">
            <div class="sticky-top">
                <div class="d-md-flex align-items-center justify-content-between mb-4 bg-white border rounded px-md-5 px-3 py-2">
                    <div class="d-flex align-items-center justify-content-center">
                        <div class="me-1 my-1">
                            {{-- <input type="file" id="file-input" accept=".jpg, .jpeg" style="display:none;" onchange="handleFileUpload(event)"> --}}
                            <button onclick="handleFileUpload()" class="btn btn-primary">
                                <i class="fas fa-signature d-md-block d-none" style="font-size: 1.2rem"></i>
                                <i class="fas fa-signature d-md-none"></i>
                            </button>
                        </div>
                        <div class="my-1">
                            <buton class="btn btn-danger" onclick="deleteAnnotations()">
                                <i class="fas fa-trash d-md-block d-none" style="font-size: 1.2rem"></i>
                                <i class="fas fa-trash d-md-none"></i>
                            </buton>
                        </div>
                    </div>
                    <div class="d-flex align-items-center justify-content-center">
                        <div class="me-1 my-1">
                            <button onclick="previewPDF()" class="btn btn-info">
                                <i class="fas fa-eye d-md-block d-none" style="font-size: 1.2rem"></i>
                                <i class="fas fa-eye d-md-none"></i>
                            </button>
                        </div>
                        <div class="me-1 my-1">
                            <button onclick="downloadPDF()" class="btn btn-success">
                                <i class="fas fa-cloud-arrow-down d-md-block d-none" style="font-size: 1.2rem"></i>
                                <i class="fas fa-cloud-arrow-down d-md-none"></i>
                            </button>
                        </div>
                        <div class="my-1">
                            <button onclick="savePDF()" class="btn btn-dark">
                                <i class="fas fa-floppy-disk d-md-block d-none" style="font-size: 1.2rem"></i>
                                <i class="fas fa-floppy-disk d-md-none"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="pdf-container" class="position-relative"></div>
        </div>
    </div>
    <div id="pre-loading-submit" class="d-none position-fixed w-100 d-flex align-items-center justify-content-center" style="top: 0; left: 0; height: 100vh; z-index:9999; background-color: rgba(0,0,0,0.8)">
        <img src="{{ asset('assets/img/loading.gif') }}" alt="" width="60px">
    </div>

    <img src="{{ asset('storage/'.auth()->user()->signature) }}" alt="" height="120px" id="signature" class="d-none">

    <script src="{{ asset('vendor/pdfjs/pdf.min.js') }}"></script>
    <script src="{{ asset('vendor/pdf-lib/pdf-lib.js') }}"></script>
    <script src="{{ asset('vendor/interact/interact.min.js') }}"></script>
    <script src="{{ asset('/') }}assets/vendor/libs/jquery/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        const url = "{{ asset('storage/'.$sign->verified_sign_file) }}";
        let pdfDoc = null;
        let canvasElements = [];

        async function renderPDF() {
            const loadingTask = pdfjsLib.getDocument(url);
            pdfDoc = await loadingTask.promise;
            const container = document.getElementById('pdf-container');

            const scale = 1.5;

            for (let pageNum = 1; pageNum <= pdfDoc.numPages; pageNum++) {
                const page = await pdfDoc.getPage(pageNum);
                const viewport = page.getViewport({ scale: scale });
                const canvas = document.createElement('canvas');
                canvas.height = viewport.height;
                canvas.width = viewport.width;
                canvas.style.width = `100%`;
                canvas.style.height = `auto`;
                canvas.id = 'canvas-' + pageNum;
                canvas.dataset.pageNumber = pageNum;
                canvasElements[pageNum] = canvas;

                const renderContext = {
                    canvasContext: canvas.getContext('2d'),
                    viewport: viewport
                };

                await page.render(renderContext).promise;
                container.appendChild(canvas);
            }
        }

        function handleFileUpload() {
            const file = $('#signature').attr('src');
            const yOffset = window.pageYOffset;
            createAnnotation(file, 50, 50 + yOffset)
        }

        function createAnnotation(imgSrc, x, y) {
            const annotation = document.createElement('img');
            annotation.src = imgSrc;
            annotation.classList.add('annotation');
            annotation.style.position = 'absolute';
            annotation.style.left = `${x}px`;
            annotation.style.top = `${y}px`;
            annotation.style.height = '60px';
            document.getElementById('pdf-container').appendChild(annotation);

            makeDraggable(annotation)
        }

        function deleteAnnotations(){
            const annotation = document.querySelectorAll('.annotation');
            annotation.forEach(anno => {
                const parentElement = anno.parentNode;
                parentElement.removeChild(anno);
            });
        }

        function makeDraggable(element) {
            interact(element)
            .draggable({
                modifiers: [
                    interact.modifiers.restrict({
                        restriction: 'parent',
                        endOnly: true
                    })
                ],
                listeners: {
                    move(event) {
                        const target = event.target;
                        const x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx;
                        const y = (parseFloat(target.getAttribute('data-y')) || 0) + event.dy;

                        target.style.transform = `translate(${x}px, ${y}px)`;
                        target.setAttribute('data-x', x);
                        target.setAttribute('data-y', y);
                    },
                    end(event) {
                        setPositionBasedOnPage(event.target);
                    }
                }
            })
            .resizable({
                edges: { left: true, right: true, bottom: true, top: true },
                listeners: {
                    move(event) {
                        let {x, y} = event.target.dataset;

                        x = (parseFloat(x) || 0) + event.deltaRect.left;
                        y = (parseFloat(y) || 0) + event.deltaRect.top;

                        Object.assign(event.target.style, {
                            width: `${event.rect.width}px`,
                            height: `${event.rect.height}px`,
                            transform: `translate(${x}px, ${y}px)`
                        });
                        event.target.setAttribute('data-x', x);
                        event.target.setAttribute('data-y', y);
                    },
                    end(event) {
                        setPositionBasedOnPage(event.target);
                    }
                },
                modifiers: [
                    interact.modifiers.restrictSize({
                        min: { width: 30, height: 30 }
                    })
                ]
            });
        }

        function setPositionBasedOnPage(annotation) {
            const bbox = annotation.getBoundingClientRect();
            for (let i = 1; i < canvasElements.length; i++) {
                const canvas = canvasElements[i];
                const canvasRect = canvas.getBoundingClientRect();
                if (bbox.top < canvasRect.bottom && bbox.bottom > canvasRect.top &&
                    bbox.left < canvasRect.right && bbox.right > canvasRect.left) {
                    annotation.setAttribute('data-page', i);
                    // Simpan posisi relatif anotasi terhadap canvas
                    const xRel = (bbox.left - canvasRect.left) / canvasRect.width;
                    const yRel = (bbox.top - canvasRect.top) / canvasRect.height;
                    annotation.setAttribute('data-x-rel', xRel);
                    annotation.setAttribute('data-y-rel', yRel);
                    break;
                }
            }
        }

        async function previewPDF() {
            const pdfDoc = await PDFLib.PDFDocument.load(await (await fetch(url)).arrayBuffer());
            const annotations = document.querySelectorAll('.annotation');

            for (const anno of annotations) {
                const pageNum = parseInt(anno.getAttribute('data-page'), 10);
                if (!pageNum) continue;

                const page = pdfDoc.getPages()[pageNum - 1];
                const { width, height } = page.getSize();

                const xRel = parseFloat(anno.getAttribute('data-x-rel'));
                const yRel = parseFloat(anno.getAttribute('data-y-rel'));

                const x = xRel * width;
                const y = height - yRel * height - anno.offsetHeight ; // Adjust for annotation height

                const imageBytes = await fetch(anno.src).then(res => res.arrayBuffer());
                const image = await pdfDoc.embedJpg(imageBytes);

                page.drawImage(image, {
                    x: x,
                    y: y,
                    width: anno.offsetWidth ,
                    height: anno.offsetHeight
                });
            }

            const pdfBytes = await pdfDoc.save();
            const blob = new Blob([pdfBytes], { type: 'application/pdf' });
            const newURL = URL.createObjectURL(blob);
            window.open(newURL, '_blank');
        }

        async function downloadPDF() {
            const pdfDoc = await PDFLib.PDFDocument.load(await (await fetch(url)).arrayBuffer());
            const annotations = document.querySelectorAll('.annotation');

            for (const anno of annotations) {
                const pageNum = parseInt(anno.getAttribute('data-page'), 10);
                if (!pageNum) continue;

                const page = pdfDoc.getPages()[pageNum - 1];
                const { width, height } = page.getSize();

                const xRel = parseFloat(anno.getAttribute('data-x-rel'));
                const yRel = parseFloat(anno.getAttribute('data-y-rel'));

                const x = xRel * width;
                const y = height - yRel * height - anno.offsetHeight ; // Adjust for annotation height

                const imageBytes = await fetch(anno.src).then(res => res.arrayBuffer());
                const image = await pdfDoc.embedJpg(imageBytes);

                page.drawImage(image, {
                    x: x,
                    y: y,
                    width: anno.offsetWidth ,
                    height: anno.offsetHeight
                });
            }

            const pdfBytes = await pdfDoc.save();
            downloadBlob(pdfBytes, 'annotated.pdf', 'application/pdf');
        }

        async function savePDF(){
            if((document.querySelectorAll('.annotation').length) > 0){
                Swal.fire({
                    title: "Terima Data?",
                    text: "Setujui data bersifat permanen!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Ya, Terima!'
                }).then(async(result) => {
                    if (result.isConfirmed) {
                        Swal.fire({
                            title: "Masukkan catatan penerimaan anda (wajib)",
                            input: "text",
                            inputAttributes: {
                                autocapitalize: "off"
                            },
                            showCancelButton: true,
                            confirmButtonText: "Terima Data",
                            showLoaderOnConfirm: true,
                            preConfirm: async (text) => {
                                if(text){
                                    $('#pre-loading-submit').removeClass('d-none')
                                    let type = $(this).attr('name');
                                    let action = 'tolak';

                                    const pdfDoc = await PDFLib.PDFDocument.load(await (await fetch(url)).arrayBuffer());
                                    const annotations = document.querySelectorAll('.annotation');

                                    for (const anno of annotations) {
                                        const pageNum = parseInt(anno.getAttribute('data-page'), 10);
                                        if (!pageNum) continue;

                                        const page = pdfDoc.getPages()[pageNum - 1];
                                        const { width, height } = page.getSize();

                                        const xRel = parseFloat(anno.getAttribute('data-x-rel'));
                                        const yRel = parseFloat(anno.getAttribute('data-y-rel'));

                                        const x = xRel * width;
                                        const y = height - yRel * height - anno.offsetHeight ; // Adjust for annotation height

                                        const imageBytes = await fetch(anno.src).then(res => res.arrayBuffer());
                                        const image = await pdfDoc.embedJpg(imageBytes);

                                        page.drawImage(image, {
                                            x: x,
                                            y: y,
                                            width: anno.offsetWidth ,
                                            height: anno.offsetHeight
                                        });
                                    }

                                    const pdfBytes = await pdfDoc.save();
                                    const blob = new Blob([pdfBytes], { type: 'application/pdf' });
                                    // const newURL = URL.createObjectURL(blob);
                                    const formData = new FormData();
                                    formData.append('_token', $('meta[name=csrf-token]').attr("content"))
                                    formData.append('pdf', blob, 'signature_document.pdf');
                                    formData.append('catatan_diterima', text ? text : 'Tidak ada catatan');

                                    $.ajax({
                                        url: '/sign/lihat-dokumen/{{ $sign->id }}',
                                        type: 'POST',
                                        data: formData,
                                        processData: false,
                                        contentType: false,
                                        success: function(response) {
                                            console.log(response)
                                            $('#pre-loading-submit').addClass('d-none')
                                            Swal.fire({
                                                text: response.message,
                                                icon: "success"
                                            }).then(() => {
                                                document.location.href="{{ route('sign.index') }}"
                                            })
                                        },
                                        error: function(error) {
                                            $('#pre-loading-submit').addClass('d-none')
                                            console.error(error);
                                        }
                                    });
                                } else {
                                    Swal.fire({
                                        text: 'Harap isi catatan terlebih dahulu',
                                        icon: 'error'
                                    })
                                }
                            }
                        });
                    }
                })
            } else {
                Swal.fire({
                    title: 'Data tidak dapat disimpan',
                    text: "Belum ada anotasi yang diupload!",
                    icon: 'error',
                })
            }
        }

        function downloadBlob(blob, fileName, mimeType) {
            const url = URL.createObjectURL(new Blob([blob], { type: mimeType }));
            const a = document.createElement('a');
            a.href = url;
            a.download = fileName;
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
        }

        renderPDF();
    </script>

</body>
</html>
