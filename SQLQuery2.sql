ALTER TABLE [dbo].[Transaction]
    ADD [delivery_id]     INT           NULL,
        [delivery_fees]   MONEY         NULL,
        [card_num]        NVARCHAR (16) NULL,
        [payment_method]  NVARCHAR (50) NULL,
        [payment_amount]  MONEY         NULL,
        [recv_name]       NVARCHAR (50) NULL,
        [recv_contactnum] NVARCHAR (50) NULL,
        [recv_address]    NVARCHAR (50) NULL;