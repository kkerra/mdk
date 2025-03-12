namespace PractWork3
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            createDocumentButton = new Button();
            inputTextBox = new TextBox();
            SuspendLayout();
            // 
            // createDocumentButton
            // 
            createDocumentButton.Location = new Point(120, 274);
            createDocumentButton.Name = "createDocumentButton";
            createDocumentButton.Size = new Size(161, 23);
            createDocumentButton.TabIndex = 0;
            createDocumentButton.Text = "Создать новый документ";
            createDocumentButton.UseVisualStyleBackColor = true;
            createDocumentButton.Click += CreateDocumentButton_Click;
            // 
            // inputTextBox
            // 
            inputTextBox.Location = new Point(3, 12);
            inputTextBox.Multiline = true;
            inputTextBox.Name = "inputTextBox";
            inputTextBox.Size = new Size(420, 240);
            inputTextBox.TabIndex = 1;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(502, 329);
            Controls.Add(inputTextBox);
            Controls.Add(createDocumentButton);
            Name = "Form1";
            Text = "Form1";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Button createDocumentButton;
        private TextBox inputTextBox;
    }
}
