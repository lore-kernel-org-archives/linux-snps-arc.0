Return-Path: <SRS0=VMfk=CT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01400C433E2
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Sep 2020 07:34:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 550B52078B
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Sep 2020 07:34:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kOFm550+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OnShKEyi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 550B52078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x1sU2IeSChDyGPjC9BfiCsTlKPZ94uSXZuPZNylRjcQ=; b=kOFm550+3EB3pLqNsPtRkPL44
	3LQD1vmRwHcxp7YcXX1DjKC3bd7hk5MG8wpC2uS8gtMvl5o6tAjHC3l3jiesTAsa/5sM+ulI270eZ
	j8asWCWPs84wyw+BzqJvXD59ZpponO1bEWj/853Usy0qJ/L3YDW/3bltmXVzA232s6A7vudgxEu7r
	ZkWR06kPajBPmT3BmL7cH4w+u6CBG/dQ3CLOZJGXNpzFj9QlJ9nVg6ZLeb5o03xGkYInAAgAlBMRC
	GkbYDQbUykEk1MvrX5S35zwVNPReqOpABFLHnk6SFPSKsdimLnZSZqhwNs+JG7bjlS/wkoGVEyv7l
	Q1HH+Enzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGH5j-0003So-Ee; Thu, 10 Sep 2020 07:33:59 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGH5g-0003ST-T6
 for linux-snps-arc@lists.infradead.org; Thu, 10 Sep 2020 07:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599723236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TkstXvqG6RqN4qPCoRfO+gk+/8nlO3iDpUuP2Bm3roM=;
 b=OnShKEyip7rXy9fWFkC7DpAVjXD1YkfbtlLMLxRbjK+NaBxs1jmfzb+Q5xrlEmmysZ694W
 kdGq3PC+Uaqz/nw0wBVkWLBSPU25/BXjMRAYFB13AaJ0EdM+sqPHIMz+RUWizs2SUZ9B78
 5eI+be2Jq600zta5xRwJyxILKGvcLNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-T4ogbhr5PSa5xj93fiRX0A-1; Thu, 10 Sep 2020 03:33:54 -0400
X-MC-Unique: T4ogbhr5PSa5xj93fiRX0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8712A801AB6;
 Thu, 10 Sep 2020 07:33:53 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-113-142.rdu2.redhat.com
 [10.10.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ABF85D9F3;
 Thu, 10 Sep 2020 07:33:52 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH] support: user more portable atomic wrappers
In-Reply-To: <c6134d47-a6e2-9a7b-939d-2863bd48f368@synopsys.com> (Vineet
 Gupta's message of "Wed, 9 Sep 2020 17:58:45 +0000")
References: <20200909033221.3549140-1-vgupta@synopsys.com>
 <87v9gnb6ck.fsf@oldenburg2.str.redhat.com>
 <c6134d47-a6e2-9a7b-939d-2863bd48f368@synopsys.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Thu, 10 Sep 2020 09:33:50 +0200
Message-ID: <878sdi84rl.fsf@oldenburg2.str.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fweimer@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_033357_047523_64033B36 
X-CRM114-Status: GOOD (  11.56  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha @ sourceware . org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

* Vineet Gupta:

> I agree that gcc atomics should be baseline. I would still propose to
> carry this patch as it makes code less verbose if nothing else and the
> wrappers are part of glibc already.

The advantage of the GCC built-ins is that they have easy-to-find
documentation.  Our wrapper macros are in the same file as the legacy
atomics that no longer should be used.  They are also not easy to use
correctly (e.g., there is no support for access to single bytes, but the
code will still compile on some architectures).

The GCC built-ins have other problems, of course.  For example, one
might accidentally introduce a dependency on libatomic (leading to a
link failure later).  But I think these issues are less severe.

Thanks,
Florian
-- 
Red Hat GmbH, https://de.redhat.com/ , Registered seat: Grasbrunn,
Commercial register: Amtsgericht Muenchen, HRB 153243,
Managing Directors: Charles Cachera, Brian Klemm, Laurie Krebs, Michael O'Neill


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
