Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37833606A338
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Nov 2026 04:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XYCz3HCi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=brhbfGN5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dogklCR10Mo9EW6/fU38EdGTkuWOYuSDmtjKoCsNYk8=; b=XYCz3HCi/cHA4p0NnNWUNYAVMQ
	fDC8zSyhRZLi9+kFgHNeT6WZ3XFD5Etgr/9nxC52xZ/fhochYpa0r+X0SijngXovLsCmlp37Wlfld
	Y8QnuddrmzEF/nw98AEVguyd/CegTH18pa9C9HMT49Uga8T7N0al6thOUln1qrs0dMQAWLM0blqaE
	sxwCaYxN6B8cXfXJEdsC5Y+53r47+FBAajfdx+Dg02cpVLR4AfS1dgjNx3/hMtbRmviGqOS2UMPf4
	CD8SwW8i7C/lO9KzPS0b0sU+Sls4G/OuOARcq+ukTo7ubsMFYb+xhcvLHoplB7DJl52vdZ0xHBMV5
	deJuY2DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOSiq-00000004JV6-2w1S;
	Wed, 04 Nov 2026 04:35:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOSip-00000004JUk-2GxP
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Nov 2026 04:35:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DD63601F6;
	Wed,  4 Nov 2026 04:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CEF81F000C1;
	Wed,  4 Nov 2026 04:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793766938;
	bh=W/RawqYH3cIEJNIGeE74Vl+KIbH3cI8A6QOSk74pxNw=;
	h=From:To:Cc:Subject:Date;
	b=brhbfGN5/OrEgbSP1uNJpt+dD+JM+4foOXQtb74sX3V3hDQInCgnEJhEZY7o88bi6
	 61wCcQDlUw9JRnZm49x/Aanq7eEzmLUIp6JmfnOs3q2gCedA9Q9+32WGEyJc+tW3m1
	 dOKqTgPTVARa9v5kDkyD6tjFeNqMPFz8Xpc7lpHtOizBEqu/QIwJf+SSD7EqVN4SE6
	 S+wovKpnixw3WC1ZPHOVgnzKCgUvM3bjnlthNotisyaHw3KtOxiF6UhXNjPGvih5pW
	 KDdmeln8s2rPXhMyg0XNnbofmLznoxOa8CfPgzXCW0K0h+RYn/vfV/0eiUP/6z39pp
	 utq0cSr9+AQCw==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 0/2] ARC io-accessors updates for 7.4
Date: Tue,  3 Nov 2026 20:35:33 -0800
Message-ID: <20261104043535.2039948-1-vgupta@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

A couple of patches that I plan to send for v7.4.
One is an old issue and other a cleanup out of it.
CC'ing Arnd to ensure 2/2 is in the right direction.


Thx,
-Vineet:


Vineet Gupta (2):
  ARC: io: work around GCC PR127718 in __raw_write{w,l}()
  ARC: io: use asm-generic MMIO accessors

 arch/arc/include/asm/io.h | 134 ++++++--------------------------------
 1 file changed, 19 insertions(+), 115 deletions(-)

-- 
2.53.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
