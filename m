Return-Path: <SRS0=yFMY=5L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC552C43331
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 23:53:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AA4520719
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 23:53:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ex/zFzJp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AA4520719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQPfbqY/OTslSV1wTZPx6SKNgXwWcTNK6Yp+tXMPe8A=; b=Ex/zFzJprofz2D
	vvll+PVytAuntgvOb0KOfJl6L0cy2lcRqcu1omkKX2gujqLPt5/eqGo7e0srMyKBcDfeS/EtqqPXf
	8G62lnQtkznC32JtBKzdG1ZO7yuo7mtotqgNijZjA1fHFj82ZtCWjTnioaBvoPfUZJW0ECbhcuLtr
	LfXcKZm44oV9HCC6KrGGATAIoCJKj9cL2phtu8mrQtd2Rpy48NpFnETqxk/qDHxb8L/fS6MMOoA39
	QuaM+FBwvUX7pzfTsfAwAaLaNd0dIN/4P85dFgUkHyOaM6hCHEdodCxG7H4j8kmio0fLDEKOCpZ6I
	WBAwDOfZAmj6Tj5vEmJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHcJ6-0004cJ-C5; Thu, 26 Mar 2020 23:53:04 +0000
Received: from esa2.mentor.iphmx.com ([68.232.141.98])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHcJ3-0004bl-D4
 for linux-snps-arc@lists.infradead.org; Thu, 26 Mar 2020 23:53:03 +0000
IronPort-SDR: U525wWdIYRqTu6krx0y64yuBJe7Nu473bIsMz5Nl4KaaTivtWQWd9ZEMYP4rz8ATcTq5wWwCl8
 awU5aF/y4xgjyRe7kD1eEcX8s382MjNb78bnj0fqs4oDoxrj1JglM6bH7YhnIRCiW0BKTp07il
 cIWDDRym4VKlwQUJY9prDEBYEqAR0BvOswangSOkU6QO+8plE8ZGrasIZm5PUOAcOKNuAEBeac
 +5QzUPr/KWis47ri2G0IBqGU+qYAuVETS9xoEdInUPyOXkZfvlJL0sUVoNKR4/v2nsv8wnyS2o
 iLw=
X-IronPort-AV: E=Sophos;i="5.72,310,1580803200"; d="scan'208";a="47074817"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa2.mentor.iphmx.com with ESMTP; 26 Mar 2020 15:53:00 -0800
IronPort-SDR: 7Mf2oF574lKj5G1P6EchZ4IFsDvBPdKGrjNRcLzW6yg1sg1Ykq1Hwv60oXNKGUBZjNuN/nqPd1
 K2IE2iNuGirkvxqXyq/dK94tfOg3MKCJxxcjLyP/nJ8zNp9wdZxitCJpxWqKNvSUigobYPihGS
 Sp9UCQ3zCXxNPAGDywoN0r9KYLv0/E0VXMfVkOHXjRyLFhy0QRa8c1ws9t1kXXyKjrsi7o0A5Y
 LyS4y/Mr8OVPdb6DoTzCUDGfKkkBxichtsb6SJpK2qIP9119GWxexQCSvhvr+X4nptGQA+h6jp
 64o=
Date: Thu, 26 Mar 2020 23:52:55 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v4 08/15] ARC: Linux Syscall Interface
In-Reply-To: <20200313030419.15843-9-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003262342490.24611@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-9-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_165301_451042_FA558305 
X-CRM114-Status: GOOD (  11.91  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-snps-arc@lists.infradead.org, libc-alpha@sourceware.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, 12 Mar 2020, Vineet Gupta via Libc-alpha wrote:

> diff --git a/sysdeps/unix/sysv/linux/arc/bits/socket-constants.h b/sysdeps/unix/sysv/linux/arc/bits/socket-constants.h
> new file mode 100644
> index 000000000000..74b0c06edb36
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/arc/bits/socket-constants.h

As far as I can see, the only reason for having this header is to use 
appropriate values of SO_RCVTIMEO and SO_SNDTIMEO for 64-bit time.

It's best not to need a separate version of this header for all future 
32-bit architectures.  So I'd suggest putting the conditionals on the size 
of time_t in the default sysdeps/unix/sysv/linux/bits/socket-constants.h 
instead.

Should the choice of values of these macros, for normal user programs, be 
based on the time_t for the current compilation (as affected by _TIME_BITS 
in future) or on the time_t for the default ABI in glibc?  If the latter, 
it would be a __TIMESIZE conditional in the header (that is, a conditional 
based on __TIMESIZE == __SYSCALL_WORDSIZE, or using __WORDSIZE when 
__SYSCALL_WORDSIZE is not defined, since the actual kernel conditional is 
about whether using the same time_t size as kernel "long").  If the 
former, it might use __TIMESIZE right now, but that would need to change 
when _TIME_BITS is supported to a different macro meaning the time_t size 
for the current compilation.

> diff --git a/sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h b/sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h
> new file mode 100644
> index 000000000000..6c129398483a
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h
> @@ -0,0 +1,6 @@
> +#define JMP_BUF_SIZE		(32 + 1 + 64/(8 * sizeof (unsigned long int))) * sizeof (unsigned long int)
> +#define SIGJMP_BUF_SIZE		(32 + 1 + 64/(8 * sizeof (unsigned long int))) * sizeof (unsigned long int)

Missing spaces around '/'.

> +/* The minimum supported kernel version for ARC is 3.9,
> +   guaranteeing many kernel features.  */

But actually it's 5.1 at present.

> +/* All syscall handler come here to avoid generated code bloat due to
> +   GOT reference  to errno_location or it's equivalent.  */
> +int
> +__syscall_error(int err_no)

Missing space before '('

> +{
> +  __set_errno(-err_no);

Likewise.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
