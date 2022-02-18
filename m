Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45803C433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Feb 2022 04:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c5BNZmr5bghSGMNXTbxFdJQfRyhN/eg6HgOWCrjVrlg=; b=NnaTBeF/prIn9C
	mk2H3T4PsyTfFvT0lsQvFzQeAm1erf2NN6xzM3WWFvh7vokcNoimAq23vFK7dQtu7GVJoXuXnrmBe
	psSW2bV7GMvRcqY53sR4eeqIYSpDBuYyT0yJEiuAMe9ka8WAuWPGEbmIgzvf83oYQOZhV01Lql+3q
	HFOlXhcxBWwSoLrM57P0/vaDQXjtrbUk1a2z9y3ynkrN5nWI7hi/3w+Lk2ofmpkHHqs04CPeQo9ZZ
	4N1clpdRot5H/SrFKIldqyBadMdfsF7gmeZ1uaY5wM7NXUg5KZkFuTPUTHzEj+yMBgLwMiSlwyuGq
	W/cDFrJDvgV5a98FQz+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKuUx-00CqNp-4r; Fri, 18 Feb 2022 04:03:59 +0000
Received: from out0.migadu.com ([2001:41d0:2:267::])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKuUt-00CqMh-3N
 for linux-snps-arc@lists.infradead.org; Fri, 18 Feb 2022 04:03:57 +0000
Message-ID: <2c22b380-2a11-9d19-2cb8-18630478c09c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1645157029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cja7lrrfr2Rrw6J81sjNgn7HgGEXUc407/5w6IXriAc=;
 b=nFf7mQuCYsfgJ4+g71jyX0TJX7ZPlHHgJv+nj6zw0abunHRl7AY/JUqF6ZgtRwHTVNpiko
 WTAcwWsR0h/B9Qc5Op5mKGqh813bTZTN7ckIHYiZWw7diCKNbPfAbsFvZVc4MkvKKG+NsS
 uRXu+dG5hwu9Phl22+TgtoKhmV6DrHE=
Date: Thu, 17 Feb 2022 20:03:45 -0800
MIME-Version: 1.0
Subject: Re: [RFC PATCH 0/3] arc: remove CONFIG_SET_FS
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-snps-arc@lists.infradead.org, Vladimir Isaev <isaev@synopsys.com>,
 Christoph Hellwig <hch@lst.de>
References: <20220201145538.111192-1-geomatsi@gmail.com>
 <f0f5d195-cddc-3a8f-3503-bb1fa602a2b6@kernel.org>
 <YgwVUmMlASsW7mSd@curiosity>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
In-Reply-To: <YgwVUmMlASsW7mSd@curiosity>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_200355_562923_534B9889 
X-CRM114-Status: UNSURE (   5.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


> IIUC it makes sense to drop this patch series from your for-next branch.
> These changes have been superseded by generic approach posted by
> Arnd Bergmann, see:
> https://lore.kernel.org/linux-arch/CAHk-=whXYWoP6of7js=f4zov62on97mNFRSVRWhY75WoGM6CoQ@mail.gmail.com/T/#t
>
> I tested patches by Arnd on ARC700/ARCHS platforms, so far so good.

Yep I've been following that thread and have dropped your ARC patchset. 
Thx for testing. You can reply to Arnd with a
Tested-by: < your-name> #arc

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
