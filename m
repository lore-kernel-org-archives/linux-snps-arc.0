Return-Path: <SRS0=ka13=4M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24C4C38BE1
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 18:39:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9860620836
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 18:39:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zc6ziO0M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="zQOE5i46";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XU083ZV5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9860620836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVvnZbagGTb85fRqcEhF7qyV064YXU2HKn2AKH/cr7M=; b=Zc6ziO0MBq+aPP
	wCfE53sxHn8UgX2vIfLb5YwVL9v+wEL1myLXODD56YNu7RLpiHv+kImp/FnTFzDtGNfR2LJ0iRUIV
	lVyEnkHagLlM4MQZASYJezwuXvfPwmHxOm9zXDVFpsDokWVp2jpRe7RSJ9Bw5239K1HhuhQtUTs4O
	fp12Jc5D9zza1H86xXPFgMJwyGUldbsdBMaosU/C5W/V2yikEH745dMQkZaFBuarSzArMf16E8CjK
	NpeMFkNJd3L4wvOZ/48YgzBOpTChwpFmoK1dFPUKN18Vw+gnEXl1b34WnvzZ7Ry0yylj/nDFwyoAV
	KV5A1/XnPdlrqL2gNg+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6Ie6-0002OS-Kd; Mon, 24 Feb 2020 18:39:58 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Ie5-0002Nx-Er
 for linux-snps-arc@bombadil.infradead.org; Mon, 24 Feb 2020 18:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=wxr1t1iYzYIc7CCUkuk/yPrVLrkk08H00fL1QpFQ0sQ=; b=zQOE5i46RR7lb1+/w6MusP39aa
 aadbOWiFtNoavmWA9/vKBV7EHigFI7F1WuBe7PGntx5dRQ2b9nrSuizN6v6wHJom/JI7TIWiCzt07
 EZJRiG5jeyzkcl5DbIXJIQqUZmVnUhXFdJOgH7tU7EMa0oxo7BX6nwu8jOG0Wt27X588OXF+ud+1s
 IwvSoIAJ/Fo7gKxo/SvCVIqN5tE5mj3CMM76Fx7vF89y/j9L3KAmeQ6cOwd2ufTRpW8sdHY09YjfS
 C9KgCoHFTfwHOpZvEwgJ3QHPHwVCM2osrasAjtYrBa2dVBM/a5qkwV9SK/A3S068+7o2T3Aam6ZmF
 MEyEe5Pw==;
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Ie3-0004rP-AC
 for linux-snps-arc@lists.infradead.org; Mon, 24 Feb 2020 18:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582569553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wxr1t1iYzYIc7CCUkuk/yPrVLrkk08H00fL1QpFQ0sQ=;
 b=XU083ZV5Vg0jngvMS4Z8vS9PlBGGJJF4YQKxQFQvZI2XATglO365Zv50wPRJWtYFzgncIx
 l6v6Ri/m6dmI5412JE4rPRb0e7JZEgtmcfAyhDMs84g7XZ+bGydOqA25zWrzlyC2Aim9C0
 3qdZhJlljw2K5EKxwsTxEwczujsaVP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478--SdFeg1uMo22AX3bHqw30Q-1; Mon, 24 Feb 2020 13:39:11 -0500
X-MC-Unique: -SdFeg1uMo22AX3bHqw30Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1F5E800D5C;
 Mon, 24 Feb 2020 18:39:09 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-116-104.ams2.redhat.com
 [10.36.116.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52CFB399;
 Mon, 24 Feb 2020 18:39:07 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH] asm-generic ABI: Allow statx syscall despite fstatat64,
 fstat64
References: <20200224182305.28027-1-vgupta@synopsys.com>
Date: Mon, 24 Feb 2020 19:39:06 +0100
In-Reply-To: <20200224182305.28027-1-vgupta@synopsys.com> (Vineet Gupta's
 message of "Mon, 24 Feb 2020 10:23:05 -0800")
Message-ID: <87wo8bn839.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: alistair23@gmail.com, linux-snps-arc@lists.infradead.org,
 libc-alpha@sourceware.org, lukma@denx.de, arnd@arndb.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

* Vineet Gupta:

> +/* Ports define to 1 when glibc struct stat64 is not compatible with
> +   kernel stat64. This forces use of statx syscall (and explicit interworking)
> +   even when fstat64 syscall is available. For asm-generic ABI this happened
> +   with switch to 64-bit time_t.  */
> +
> +# undef STAT64_IS_NOT_KERNEL_STAT64

Sorry, I think that going forward, we prefer that such macros are always
defined, with values 0 or 1 as appropriate.

Thanks,
Florian


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
