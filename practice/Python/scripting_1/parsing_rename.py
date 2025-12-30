import os
os.chdir('/Users/srisairakeshnakkilla/EDA/Projects/practice/Python')

for f in os.listdir():
    # print(f)
    f_name,f_ext=os.path.splitext(f)
    f_title,f_num = f_name.split('_')
    f_title = f_title.strip()
    f_num=f_num.strip().zfill(2)

    print('{}-{}{}'.format(f_num,f_title,f_ext))

    if f_ext:
        new_name = '{}-{}{}'.format(f_num,f_title,f_ext)
        os.rename(f,new_name)

