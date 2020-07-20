Return-Path: <SRS0=+Xh6=A7=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8984C433E4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Jul 2020 07:26:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95C04207DF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Jul 2020 07:26:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C8NOUq74";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EpBiavs4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95C04207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mChbeTZ3gSLfDfLNlof6KlngC1OWxK7oe/mM/4+1370=; b=C8NOUq74q98xvSxhl98GBMfFl
	Ga9tw2GBT8D6juwYOcEZl+aofKE37F3L6Rb6IxP55JSZ78AP/ahnc2IHhimFYsxwD3w95+8xfuTcD
	dPDETloHBMqRWuiQ+5O6dHcOwiHI0kLX2M2SJ+ask4vDSp0+7lQJ/ZRyhrS1nfQi0vcJtwwAfFFfW
	BIzz6DNAkGYvEDaHoL8o+VLqDlB0E/yHWmqrATElZ0RiPP+hATiVddn9KOfAtAMC23zsHh413eYjU
	PZP054MsY7Rl06AdE+evN4RHg4NsjLeANtRqm9scSw5jJaKaajVGSieHPcK+WLDwz9CoB2fL0AueL
	MKuY9B/aA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxQCD-0003Xu-TN; Mon, 20 Jul 2020 07:26:45 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxQCB-0003XH-82
 for linux-snps-arc@lists.infradead.org; Mon, 20 Jul 2020 07:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595230001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TddnZQDUxSwV2xgwM86e/khf2Ytr0wwvSJW1uHvB7zk=;
 b=EpBiavs4tGL17TDDlN8AVg2yQ4NBRZs5bkyIfIYzeCH8gGO8y3rp0MQPV59Sf0NulUYL3/
 wRW8igXfLavVmWOsa6MAjuusfvYTXK2CgKSDr7VKhdvQ6WBwxV14uW8TFiV6qUZXcQ0lZz
 TlY4NWiPwJN4/v8lcx5sjHTqVsYzTJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-XGQgZQgPPRaS4s2DoeXTlA-1; Mon, 20 Jul 2020 03:26:37 -0400
X-MC-Unique: XGQgZQgPPRaS4s2DoeXTlA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0BEA800470;
 Mon, 20 Jul 2020 07:26:36 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-112-226.ams2.redhat.com
 [10.36.112.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EADA5C1D4;
 Mon, 20 Jul 2020 07:26:32 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org>
Subject: Re: [PATCH] Fix tst-libc_dlvsym{,
 -static} on ARC: don't check _sys_{err, sig}list
References: <20200719210235.21767-1-vgupta@synopsys.com>
Date: Mon, 20 Jul 2020 09:26:30 +0200
In-Reply-To: <20200719210235.21767-1-vgupta@synopsys.com> (Vineet Gupta via
 Libc-alpha's message of "Sun, 19 Jul 2020 14:02:35 -0700")
Message-ID: <87v9iizly1.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fweimer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_032643_322119_7E3E0E82 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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
Cc: Carlos O'Donell <carlos@redhat.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

* Vineet Gupta via Libc-alpha:

> diff --git a/elf/tst-libc_dlvsym.h b/elf/tst-libc_dlvsym.h
> index 6b132dd7c3e4..7eda47207824 100644
> --- a/elf/tst-libc_dlvsym.h
> +++ b/elf/tst-libc_dlvsym.h
> @@ -117,8 +117,6 @@ compare_vsyms (void)
>       obtain an explicit handle for libc.so.  */
>    void *libc_handle = xdlopen (LIBC_SO, RTLD_LAZY | RTLD_NOLOAD);
>  
> -  compare_vsyms_1 (libc_handle, "_sys_errlist");
> -  compare_vsyms_1 (libc_handle, "_sys_siglist");
>    compare_vsyms_1 (libc_handle, "quick_exit");
>  
>    xdlclose (libc_handle);

Please use TEST_COMPAT, as in malloc/tst-mallocstate.c.

Thanks,
Florian


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
