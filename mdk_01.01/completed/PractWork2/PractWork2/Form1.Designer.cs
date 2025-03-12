namespace PractWork2
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
            registrationButton = new Button();
            loginTextBox = new TextBox();
            passwordTextBox = new TextBox();
            SuspendLayout();
            // 
            // registrationButton
            // 
            registrationButton.Location = new Point(58, 175);
            registrationButton.Name = "registrationButton";
            registrationButton.Size = new Size(100, 23);
            registrationButton.TabIndex = 0;
            registrationButton.Text = "Регистрация";
            registrationButton.UseVisualStyleBackColor = true;
            registrationButton.Click += RegistrationButton_Click;
            // 
            // loginTextBox
            // 
            loginTextBox.Location = new Point(58, 43);
            loginTextBox.Name = "loginTextBox";
            loginTextBox.Size = new Size(100, 23);
            loginTextBox.TabIndex = 1;
            // 
            // passwordTextBox
            // 
            passwordTextBox.Location = new Point(58, 114);
            passwordTextBox.Name = "passwordTextBox";
            passwordTextBox.Size = new Size(100, 23);
            passwordTextBox.TabIndex = 2;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(290, 253);
            Controls.Add(passwordTextBox);
            Controls.Add(loginTextBox);
            Controls.Add(registrationButton);
            Name = "Form1";
            Text = "Form1";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Button registrationButton;
        private TextBox loginTextBox;
        private TextBox passwordTextBox;
    }
}
