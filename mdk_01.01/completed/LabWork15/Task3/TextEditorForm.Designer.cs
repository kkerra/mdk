namespace Task3
{
    partial class TextEditorForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            textBox1 = new TextBox();
            replacementBtn = new Button();
            SuspendLayout();
            // 
            // textBox1
            // 
            textBox1.Location = new Point(12, 12);
            textBox1.Multiline = true;
            textBox1.Name = "textBox1";
            textBox1.Size = new Size(667, 302);
            textBox1.TabIndex = 0;
            // 
            // replacementBtn
            // 
            replacementBtn.Location = new Point(55, 358);
            replacementBtn.Name = "replacementBtn";
            replacementBtn.Size = new Size(75, 23);
            replacementBtn.TabIndex = 1;
            replacementBtn.Text = "Замена";
            replacementBtn.UseVisualStyleBackColor = true;
            replacementBtn.Click += button1_Click;
            // 
            // TextEditorForm
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(replacementBtn);
            Controls.Add(textBox1);
            Name = "TextEditorForm";
            Text = "TextEditorForm";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private TextBox textBox1;
        private Button replacementBtn;
    }
}