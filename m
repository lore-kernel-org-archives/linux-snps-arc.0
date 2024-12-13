Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BCAE77183
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Dec 2024 08:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EvWgEygsZ8fD/4T6BQuv3nrTDvR2MPNWwn7ipvVue0Q=; b=LjofDQ0N1EhRi4
	BFi3Gpn5rVUs/J+sJuar8Qs3XMzhVXitvl9kqSf9xmkgikaRoTW134Cq7ti94IuIwIhYAdh+4zhOJ
	gF2P19QIoJwgS9VFS905RyipXHKNJX79IKrjHiPu4jz4cK8Y1sHH+VEfMa6UBlr3Zji/lhBE282QN
	BB52MxJfU3CGlIMkkTVbEIZEjJOcLQKce24zrTARdnIiBv5WMy1/Q/wfKtAGRCrhcghBEA8pgMeTv
	PD4ToMF834AlqsNrNjyszBZjV3dg19cO1N0YS8mLn3HE0fDIWU9ONDv7Gv3gu/CgFuhAlqFarFUKe
	1Cu+qY/ZY3YQZd2i3YAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM0gN-000000032Ps-0GVL;
	Fri, 13 Dec 2024 08:05:55 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM0gK-000000032O8-2rco
	for linux-snps-arc@lists.infradead.org;
	Fri, 13 Dec 2024 08:05:53 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so1823846a12.2
        for <linux-snps-arc@lists.infradead.org>; Fri, 13 Dec 2024 00:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734077150; x=1734681950; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lgwYE8AkKohlShjZLrwteb4c+nimfkWQZUupQYO5W68=;
        b=cXuGTRIDZnVY6N7BdSB7bVrr2dxDw8d0xO6HFxuYspxGXmV3vwJumcoHjNKXfry+iA
         avGTPYnayFq78u8kt9Eq+xGmleNXhbLPeulgAeEqL9ADJN0Jt4stNB1ScmQoYDygBDl4
         hEDpvBcixT/v7k9fVV71pqWucWQ2cKiRCcNPxu7du8Xu7+5dDJFClF9ZM4vfIbxk8r/F
         TPe09FAeAWtPC4ZqWASyltCIGYhOrEM+z0xhnejr7mRL3IUkTWWVbyXPsfHbYZ5uhGSf
         p9nbQ3hza5iFEXegMcwcoliphoIkcc/jzG9xzG3wsmz8j8OGKlqd3ABWCebDRKnE1hMN
         B4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734077150; x=1734681950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgwYE8AkKohlShjZLrwteb4c+nimfkWQZUupQYO5W68=;
        b=RGoTevgaixUbAueFcYVRgRUB19VAQ5Ic5iUrR1RTpMVLUW009OyDsxL39/M9is1Ey5
         kCXK7TMq+RAW7BemJTvOlmIeoYe14OEhluoE9fHVbNwk8L7A/+x28P6MCr2+4fCr7gde
         ghmYuxQOWKEf8ahPaosakHUQ3GNO8uN/Q/O7dm+nHTVB5sPgoWOrYvWoNLb7S7XDcVtc
         3yU5E+fFtDYZ3uM9z5XVY0p1u0dg5gpaAY3443Ew1ta6gZPdapX2/BTuahZWIv4adNyE
         Xzjq0zBjQO72793L4k5spmOOP5acJXq8TmHrlVIjoJxfC8ixjwiubl640gRHGZBpmLKl
         QjZg==
X-Forwarded-Encrypted: i=1; AJvYcCWnooWQ5W+xKQMOgPgnfOfa7t39TA4tbZRH0VwEk41BQY4ZrkNNOj+IyImHbdY94vCv+HCZpXbzlzN6MTm2hg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1t8DII7kawVWnUe5TeLRemCMaHgMoPW5jae4zffjsTld9CiBE
	GmU5Xi6vt8mS0fjivfjRo8JkLitVmQBkTxIoeqFl4w8qCGpRJuERLuxbMtGi6kY=
X-Gm-Gg: ASbGncsW6Zhss8Jlpb3YsEz+U5BxT4+cniWVOMSrtjRTdwKu/lFN7ykAqKySZw1bJOM
	21bRZx3SE2vRri/6a0+Y87gLeU9VmUyKCrFDMQQaajrsC76eOFymT02c4S/7dsRMcTaoQq8WCso
	exLB9K185BHWTelyWK0+/5X0i0ytxWGZZThuwUuDMxV/YIOepJyzPwUeXszGTD7D+e4YSc1vOO3
	Po8/Wl63jpcrRwNJrf7uF8/FLdk+WUGfJEkCM6am4+jdn2qEoylSwMA4A==
X-Google-Smtp-Source: AGHT+IEBU3KaEVduDDJFmDiYKp43p4o//mXEFM4u7vCzKG7h47JoeDZ5E1DdrcH3VOsdWE+nfKrYuQ==
X-Received: by 2002:a05:6402:4584:b0:5d0:ea4f:972f with SMTP id 4fb4d7f45d1cf-5d63c318beemr3590523a12.8.1734077150211;
        Fri, 13 Dec 2024 00:05:50 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3ef026a41sm7507030a12.15.2024.12.13.00.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 00:05:49 -0800 (PST)
Date: Fri, 13 Dec 2024 09:05:47 +0100
From: Petr Mladek <pmladek@suse.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
	x86@kernel.org, linux-snps-arc@lists.infradead.org,
	linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, ocfs2-devel@lists.linux.dev,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH 1/7] vsprintf: Add %pTN to print task name
Message-ID: <Z1vq2-V7vB5KhBR9@pathway.suse.cz>
References: <20241213054610.55843-1-laoar.shao@gmail.com>
 <20241213054610.55843-2-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241213054610.55843-2-laoar.shao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_000552_719013_45630791 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri 2024-12-13 13:46:04, Yafang Shao wrote:
> Since the task->comm is guaranteed to be NUL-ternimated, we can print it
> directly. Add a new vsnprintf format specifier "%pTN" to print task comm,
> where 'p' represents the task Pointer, 'T' stands for Task, and 'N' denots
> Name. With this abstraction, the user no longer needs to care about
> retrieving task name.

What is the advantage, please?

Honestly, I believe that the meaning of

	printk("%s\n", task->comm);

is much more clear than using a cryptic %pXYZ modifier:

	printk("%pTN\n", task);


The %pXYZ modifiers makes sense only when the formatting of the printed
information needs some processing. But this is a plain string.
IMHO, it is not worth it. In fact, I believe that it is a
counter productive.

Best Regards,
Petr

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
