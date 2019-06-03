From: schwab@suse.de (Andreas Schwab)
Date: Mon, 03 Jun 2019 10:22:55 +0200
Subject: Pass config-time variable to LIBC_SLIBDIR_RTLDDIR
In-Reply-To: <CY4PR1201MB01200F5CBFD010ADC371E89EA1190@CY4PR1201MB0120.namprd12.prod.outlook.com>
 (Alexey Brodkin's message of "Fri, 31 May 2019 10:14:57 +0000")
References: <CY4PR1201MB01200F5CBFD010ADC371E89EA1190@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <mvm7ea39ixs.fsf@suse.de>
To: linux-snps-arc@lists.infradead.org

On Mai 31 2019, Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:

> I guess mentioned change is not supposed to be reverted but then
> how do you think it's possible [if at all] to implement that kind of
> "automatic" setup of slibdir/rtlddir?

As the commit message says, you can reference makefile variables in the
value.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
