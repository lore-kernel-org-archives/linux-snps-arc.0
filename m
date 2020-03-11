Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A848AC0044D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 22:28:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F1F620575
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 22:28:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uL36E6D2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hxdyZclq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F1F620575
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=H662JFWtdgwPVicsOwlpdepX1eqe0INibmCfxD1ygSo=; b=uL3
	6E6D2gWfeQarhAuAU6UVN+u6sJhcgj9wF++hmLjJ1b5HuDSLvxXTVdDhXb7Ve2Z/gxQpyr7UIOv2I
	OJQvEdsnUSbC4ijpZdznHBeJHmhcnI6ElVhuwgcxtO3qSJszuPIjulv/bAcw+xjSoZytYRZMaSJ4o
	m0fuSooQGVszvkH8/G4DohyTN51CZJhKrcEsI0jEZkVrM/UpCy42TQnGFiOenMSGLWkLiPAf18Yhn
	Jn60n+tDWDM+eBNPSpA0DVXpQrAaH1Nf9r2RlDL9U7YX9TE4eZ0tNYR5ewNadIsenuZPcmmhI3dzw
	XDamIXCahpQTVhWe23hak8uh9gGUBeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC9qG-0004wY-Sj; Wed, 11 Mar 2020 22:28:44 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC9qE-0004w4-Il
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 22:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583965721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=MnKDgWcsbDRX8+TSximhOf3I90HoP6lgaC0Ih+xsDKo=;
 b=hxdyZclqVS27LfWYlpUQfOEt1ROehKT6Jp3YDVlTIGdimM1WEvxWIphJrWjIc3WlrIaXQN
 ipCsFSCGy2hKovPb7QmL1fXXWnIJe4TtDfgKiNlJ7MjVowvw1e8DQE4uuEa1oo4isLX08E
 LariJ1ZHfIdGDwSNjO0nPXRuWsanVsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-ljerDLeuMLqUya2yE-0TBg-1; Wed, 11 Mar 2020 18:28:39 -0400
X-MC-Unique: ljerDLeuMLqUya2yE-0TBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D40BA0CC5;
 Wed, 11 Mar 2020 22:28:38 +0000 (UTC)
Received: from greed.delorie.com (ovpn-116-104.phx2.redhat.com [10.3.116.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D339792D32;
 Wed, 11 Mar 2020 22:28:37 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
 by greed.delorie.com (8.14.7/8.14.7) with ESMTP id 02BMSbET005806;
 Wed, 11 Mar 2020 18:28:37 -0400
From: DJ Delorie <dj@redhat.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: How to elf/tst-ldconfig-* in cross test setup
In-Reply-To: <e92a698d-1378-5990-d7f8-05c27c5bd689@synopsys.com> (message from
 Vineet Gupta on Wed, 11 Mar 2020 22:21:58 +0000)
Date: Wed, 11 Mar 2020 18:28:37 -0400
Message-ID: <xntv2u4jca.fsf@greed.delorie.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_152842_703994_2092EB01 
X-CRM114-Status: UNSURE (   4.82  )
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
Cc: linux-snps-arc@lists.infradead.org, libc-alpha@sourceware.org,
 ahajkova@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Vineet Gupta <Vineet.Gupta1@synopsys.com> writes:
>> $ make test-wrapper='<full path
>> to>/br/build/glibc-867196a7635/scripts/cross-test-ssh.sh root@192.168.0.20' xcheck
>> subdirs=elf
>
> FWIW the original failures were here
>
>   lock_fd = open (concat (pristine_root_path, "/lock.fd", NULL),
> 		 O_CREAT | O_TRUNC | O_RDWR, 0666);
>   if (lock_fd < 0)
>     FAIL_EXIT1 ("Cannot create testroot lock.\n");   <----

That's inside test-container.c and should be referring to the
test-root's root (i.e. <full path to>/br/build/glibc-867196a7635/testroot.root/lock.fd

Is there a UID mismatch between the two systems?  Did you run a full
"make check" at least once, to build the initial testroot?  It does a
full "make install" into $build/testroot.pristine/ to use as the basis
for the container's root.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
