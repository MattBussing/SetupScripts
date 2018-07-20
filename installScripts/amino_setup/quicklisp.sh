if [ ! -f "quicklisp.lisp" ]; then
    wget https://beta.quicklisp.org/quicklisp.lisp
    sbcl --load quicklisp.lisp \
         --eval '(quicklisp-quickstart:install)' \
         --eval '(ql:add-to-init-file)' \
         --eval '(quit)'
else
    echo "quicklisp file downloaded already. Assuming it is installed. Skipping..."
fi
