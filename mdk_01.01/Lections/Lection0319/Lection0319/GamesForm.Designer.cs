namespace Lection0319
{
    partial class GamesForm
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
            gamesDataGridView = new DataGridView();
            ((System.ComponentModel.ISupportInitialize)gamesDataGridView).BeginInit();
            SuspendLayout();
            // 
            // gamesDataGridView
            // 
            gamesDataGridView.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right;
            gamesDataGridView.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            gamesDataGridView.BackgroundColor = Color.White;
            gamesDataGridView.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            gamesDataGridView.Location = new Point(12, 12);
            gamesDataGridView.Name = "gamesDataGridView";
            gamesDataGridView.Size = new Size(1016, 448);
            gamesDataGridView.TabIndex = 0;
            // 
            // GamesForm
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.White;
            ClientSize = new Size(1040, 525);
            Controls.Add(gamesDataGridView);
            Name = "GamesForm";
            Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)gamesDataGridView).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private DataGridView gamesDataGridView;
    }
}
