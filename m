Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6F1C6FD19
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Mar 2023 21:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MNYG3GOisBos+iOrJqWBjHDMRA6FbP1OB/a1Y4rWFZw=; b=wu4VpYd2LvMsMP
	f8eD75Yyx/3vKLV1M3NSPkF0uaQhZNu+qZXgTWZQXV+2EeuMRTrA1xdlUbKs+HrzS8PAH6scK5vO3
	livs7fny9/JY3SjI6c3QPqbZULarntg52OmaAFl+aC3PvPIaTSPntSqgH2V1ky7l4GqHV9CvsYjFy
	PkFgmON5r6ASwDpsqu0RnC4PdbpFHkEvj0p9/7FLBeSzUYis3jLSi1s+Nj6nj56CJDHA5xB/3icyX
	cAr7GrWeeq0tItKMtdk/QA+XNYvfxrlI72I+ebo8yk/LpYN6rH1710OHEBdXoEeF2R5DmllD0qJd7
	objMCUoOC9RsLFozfLYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbq8L-0080ek-Hz; Mon, 13 Mar 2023 21:55:09 +0000
Received: from [103.30.145.160] (helo=defaultworkshop.klidefectmanagement.com.novalocal)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbq8I-0080e4-KK
	for linux-snps-arc@lists.infradead.org; Mon, 13 Mar 2023 21:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=asda.co.uk;
	s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=XBPw5J0wViT4ZiJB/AJbqpzrynpl64xT6vbHCbtbR/0=; b=H
	qcm5X12iodkJWrlEJp7fF0WFbZsiVWyoWjA19QWa3FE2ZABXsUj1HVRm+xuNYIBvNgwTbtZ69hkiB
	TNkqdeIJHkz/8z4wGVnZaXkIkJNUMtTka19C7hctIxMM2VrYLp++4eMDkrYctpeM00a9UXSLiWN3Q
	YdsWqgTjmwWTNBDw=;
Received: from ec2-52-11-215-80.us-west-2.compute.amazonaws.com ([52.11.215.80] helo=asda.co.uk)
	by defaultworkshop.klidefectmanagement.com.novalocal with esmtpa (Exim 4.94.2)
	(envelope-from <sales1@asda.co.uk>)
	id 1pblzt-0006Bi-1h
	for linux-snps-arc@lists.infradead.org; Tue, 14 Mar 2023 00:30:09 +0700
From: ASDA Stores Limited <sales1@asda.co.uk>
To: linux-snps-arc@lists.infradead.org
Subject: First quarter procurement order/enquiry
Date: 13 Mar 2023 17:30:08 +0000
Message-ID: <20230313152049.ED2C85A4F2897783@asda.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_145506_688427_C775F4DA 
X-CRM114-Status: UNSURE (  -0.82  )
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
Reply-To: sales@asda-c.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Dear linux-snps-arc
I'm a procurement manager  with ASDA Group (the owners of ASDA 
Stores) and your company product has caught our interest. 
Therefore, we request you send
list and prices of your hot selling items (products) for our 
evaluation/pick.

Soon as we receive your reply, we shall send you our company 
profile and buying proposal. You can also check our website below 
for detailed info of our purchase area and trading capacity.

Your immediate response E-mail:  sales@asda-c.com   shall be 
appreciated.

Best Wishes

Ms Stelle Montgomery
Purchasing Dept.
ASDA Stores Limited
Tel:  +44 7418367220
WhatsApp: + 44-7502985874
Website: www.asda.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
