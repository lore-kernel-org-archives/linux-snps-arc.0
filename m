Return-Path: <SRS0=N0Bh=Y6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9C3C5DF63
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Nov 2019 14:27:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E8012178F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Nov 2019 14:27:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ESXO6HxL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E3q6tH1p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E8012178F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QOP6c/iQBe12TDCHtuP4GgnfNqBU9D6Vm/PirJDZ4pw=; b=ESXO6HxLshWSVl
	WwlzGsBZQIYzQeWsWMQFuWLgS/rnaMzmi0XblwGFeEInS0hKQgMwRPXlmdtWJo/xheseiLiagWflP
	Ztn0Pnl2BkLpNKZLyEDOo/oq1KZeyP6n8iSLZFaFZBgUGOTkI66v/umQFOfnXH+RtI9lbX/pooLud
	fMfvOrmLXzDesHbUFDMSczsDEXCogTYvUZlFbj6epU28gpHPzprV7k63BDHkUeVWtugzUZo1ak/tp
	TG6eItKaMHHxKVfXZ+N7uqdXGDbrIZLvJ+I/ExGIw8pmOR7LR89Le87fdV+prF2ZVP4Za3lq1zXzf
	L82GSXr57cdQsrpGQL4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSMHW-0001Db-8M; Wed, 06 Nov 2019 14:27:34 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSMHS-0001Cm-I4
 for linux-snps-arc@lists.infradead.org; Wed, 06 Nov 2019 14:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573050448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dNBwUDF4NkGdvYVjZyaMCF/Nctv75h+Ajg0ZGp8BlJo=;
 b=E3q6tH1p65jH4ZtOCvkmHOTu5GpAwH8wU/qHI8tuVvEmD3kpIylL5PjDHj42s6Cbnty5vD
 OK/aEf/JvudxNrPAVUGEw7HCVIbt04WgVxgxOSbKFXN2t3/nowJoiNRDN0G4H8ot3fe8kd
 4gMJns/Onb0fUC4muJdrOsDkqjrOheg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-4NTH1_IoN9uL7obrLYn25A-1; Wed, 06 Nov 2019 09:27:26 -0500
Received: by mail-ed1-f72.google.com with SMTP id l6so9974133edc.18
 for <linux-snps-arc@lists.infradead.org>; Wed, 06 Nov 2019 06:27:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kwyw7pGCinUEhtQH1XUqWlLc7j1wZmWOVLRW93CpaGM=;
 b=AEfWE1eZ5WySOdWFS4XbScLZV/YRlu2omDdtNG2Jb6+DPKlSrh0lPsKeEI7CYbcOwL
 diPaVrk/kMIMIl4IfxkprdgPVlXmCU7SX5TV1viYX31Y7kcLQmLGPyeHcZYAtuB0BR4F
 csrV3K1KHSx+B7z7KByp4EgEv5Izstu6bhftpCAECN4SDmtTaX/sk27mcycugtfRts9i
 Ly3lHi71c6FMXQjork5Wp2dYFukqYJW90oS1bQgPeiOkdULpoJIJRUwqerKLb1PmYdwI
 XyGokFfJeAosJV6iLN9Ku2vNC7Jz293OktmpedWC3MeuQfdk/Qnu1NYBX8qRYoP1gI86
 38xA==
X-Gm-Message-State: APjAAAXeAaYOnp5Z0MyeV1N3J0S9wiyg9uc3EKE4ldX5RZh9TJCvf8m1
 a6fCX+0PRthIs3KuvFX6RaygpYWdybf+LFCV1fo5ylWKYDM2ZdMkxYMsfrMoqYiUXio0nx/exjn
 22YKTZumD4cXku85LICzvmbUV4s70SPu6
X-Received: by 2002:a50:97af:: with SMTP id e44mr2947304edb.3.1573050445024;
 Wed, 06 Nov 2019 06:27:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqxCUNjHBpCvVFUVeb4ZHPMfJ0n0jrq329SGAh0L3x6LDV0w3c51oRSYKBFSIZ85U8GwomEIFQ==
X-Received: by 2002:adf:f547:: with SMTP id j7mr3036179wrp.69.1573050443842;
 Wed, 06 Nov 2019 06:27:23 -0800 (PST)
Received: from ?IPv6:2001:8a0:f913:f700:56ee:75ff:fe8d:232b?
 ([2001:8a0:f913:f700:56ee:75ff:fe8d:232b])
 by smtp.gmail.com with ESMTPSA id f143sm3516228wme.40.2019.11.06.06.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2019 06:27:23 -0800 (PST)
Subject: Re: [PATCH v2] gdb/remote: Remove negative tid/pid handling in
 wite_ptid
To: Evgeniy Didin <Evgeniy.Didin@synopsys.com>, gdb-patches@sourceware.org
References: <20191106132732.11034-1-didin@synopsys.com>
From: Pedro Alves <palves@redhat.com>
Message-ID: <73f36a2f-444c-3057-f642-f9f7279574b5@redhat.com>
Date: Wed, 6 Nov 2019 14:27:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20191106132732.11034-1-didin@synopsys.com>
Content-Language: en-US
X-MC-Unique: 4NTH1_IoN9uL7obrLYn25A-1
X-Mimecast-Spam-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_062732_182158_8A5C8AD5 
X-CRM114-Status: UNSURE (   8.70  )
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
Cc: Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 11/6/19 1:27 PM, Evgeniy Didin wrote:
> Actually thread and process ID's are positive values. Accorting to
> http://man7.org/linux/man-pages/man7/pthreads.7.html
> threads are creating using "clone" syscall, so the ID generation mechanism
> is similar for threads and processes. According to Linux source code
> there is a function call tree, which allocates  PID[TID]:
> clone
>  |->_do_fork
>     |->copy_process
>       |->alloc_pid
>         |->idr_alloc_cyclic
>           |->idr_alloc_u32(idr, ptr, &id, max, gfp);
> And in idr_alloc_u32() "id" is u32 value, which means positiveness.
> Also according to:
> https://elixir.bootlin.com/linux/latest/source/kernel/pid.c#L177
> PID cannot be less than 1.

Sure for Linux.  But negative numbers have meaning in the remote protocol:

 https://sourceware.org/gdb/current/onlinedocs/gdb/Packets.html#thread_002did-syntax

Thanks,
Pedro Alves


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
