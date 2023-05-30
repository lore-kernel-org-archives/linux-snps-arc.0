Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FE9C7EE2E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 May 2023 09:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4CHmysldzQKI21WO2RlYHJnf2z4sJ2Ftre0Nd6SLVA0=; b=M+S/7Iuw4zOmFy
	idbxcMUpwcIVxWR0Ymw7CWh0cdyKF9z+UuChCabRDbv/rzULUv2Gd/pvvxkGtjEaVoQ6iWmt4zcYD
	EykCl16mfsYHbdG26nllr1XkzUQ9BCsBZAztYNI5RT2pk84Re/FtAeij94Bt+6qbPVnGx21ATtkrG
	uY4JGDKo+iBTEelOdu6A+IvnApSYsf9cOhM3a+aG3c4WDxQqdw24iMJrDCzVbP9AY1FLj1ZmljtYt
	oGpsGbNzWA+LzFLha0Ram3vQ2TFoad7tQgoYnOSskhSDPBT2aI9Bw5Es4CJNBZIC9xyu1EQ/WKb6q
	/SJCePkYewJ8HIfsWLMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vbP-00D9UC-2P;
	Tue, 30 May 2023 09:25:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vbM-00D9Ry-1T
	for linux-snps-arc@lists.infradead.org;
	Tue, 30 May 2023 09:25:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685438710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5OSazfFhKBuzJDvth1f7Dqd7hERmV/6oE9F1R8Geijg=;
	b=Epahyvx0Igxu4sWW4glDC2Nb6NfJZF38aJ5a9aZ69YFORtecP8lfVrpZW1cjhokFs4bRTD
	VKUhyrtxMvW7pJnfCmUdLJpzzGTEmHKlSSJnND4xtXA3g9HZmkuV6xL9r6EjA4RUSpsp1y
	8y0RryMkX3D2Ogc9yKnfX9g1nV8hURY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-S-hb1pRvMniLEpkD_s7AUg-1; Tue, 30 May 2023 05:25:07 -0400
X-MC-Unique: S-hb1pRvMniLEpkD_s7AUg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 372DF811E86;
	Tue, 30 May 2023 09:25:06 +0000 (UTC)
Received: from localhost (ovpn-12-192.pek2.redhat.com [10.72.12.192])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47035492B0A;
	Tue, 30 May 2023 09:25:04 +0000 (UTC)
Date: Tue, 30 May 2023 17:25:01 +0800
From: Baoquan He <bhe@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, arnd@arndb.de, christophe.leroy@csgroup.eu,
	agordeev@linux.ibm.com, wangkefeng.wang@huawei.com,
	schnelle@linux.ibm.com, David.Laight@aculab.com, shorne@gmail.com,
	willy@infradead.org, deller@gmx.de,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v5 RESEND 07/17] arc: mm: Convert to GENERIC_IOREMAP
Message-ID: <ZHXA7RP9bv4Cz4VA@MiWiFi-R3L-srv>
References: <20230515090848.833045-1-bhe@redhat.com>
 <20230515090848.833045-8-bhe@redhat.com>
 <ZGR01vnozJmVIVEi@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZGR01vnozJmVIVEi@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_022512_574647_47AEE82D 
X-CRM114-Status: GOOD (  11.93  )
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

Hi Christoph,

On 05/16/23 at 11:31pm, Christoph Hellwig wrote:
> > +#define ioremap ioremap
> > +#define ioremap_prot ioremap_prot
> > +#define iounmap iounmap
> 
> Nit:  I think it's cleaner to have these #defines right next to the
> function declaration.

For this one, I didn't add function declaration of ioremap_prot and
iounmap in arch/arc/include/asm/io.h and the same to other arch's
asm/io.h. Because asm-generic/io.h already has those function
declaration, then ARCH's asm/io.h includeasm-generic/io.h. I tried
adding function declarations for ioremap_prot() and iounmap(), building
passed too. Do you think we need add extra function declarations in
ARCH's asm/io.h file?

Thanks
Baoquan


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
