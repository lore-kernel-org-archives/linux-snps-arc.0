Return-Path: <SRS0=6bto=2A=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D884FC2D0BF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Dec 2019 22:47:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80EC520828
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Dec 2019 22:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XA9hHwdL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZEGdb2Ym";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="HSWTIC3L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80EC520828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c0rQHYYxvs+G8fsaxvtkA+1BGTEFlr+8t4TcP9vD9yM=; b=XA9hHwdL/Yu+H0
	saBwFdcEfs30gS5KtBoYA80GbRkPRIGDcReyTqKKsVEKoEZsV6KUG2zGnGDCPgEYwL/cPK6O6Ptlx
	xz4MfbpOBgSQxMsuzAsLPCIulxFsDivkOMkzMvY9DLgtYzPZOVqxExIErNIvivcKa0g6uBvFJJ2Wk
	Nn4Pbh4QzTayBGcYSfpeNPNgLlKSwRujuv97KxsiCqK5iQR4igGRwkiD8Ereq91iRcOeL6as1aDro
	CmQ3UMNG1aRRCB2DN6bXLYozMrNAQ4E72wji7Hs1MNZhyKA92IIzbigsHMv1/Vg+P3TewRxs2iB0D
	pKKCfH/u0z1MkwHc1xiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieoHT-00039o-Ff; Tue, 10 Dec 2019 22:46:59 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieoHP-00038g-1c
 for linux-snps-arc@lists.infradead.org; Tue, 10 Dec 2019 22:46:57 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 580EC42D2B;
 Tue, 10 Dec 2019 22:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1576018011; bh=vLe/08CnUh1bBOnf5EhU9qcV4Y15JKfUA1Fg8UI4cE4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ZEGdb2Ymfhpr/A7qdklMekhwJ97kPfimHOunjhki22pAcBcByYZvtvkrpvsrcWQpG
 rQ2e1IY5Bj31pFCl31ZgtWiezAOfKcyrS25z4FX1GM54oK4WZ1ERqkSWpZ/uYQuobT
 MH06lI8i0VV0OEF2ivz62ZJ6+Z7OHEhlG64o4A1d20/z7uCIX+YsT3ERR3MeyPZwFW
 TL7b+Pyg09njP7vdAju5Oi8y/nRAxXkYnDBA+zvdgQQ96a/sxMM339fippTRDuTVyJ
 aA6QAS+QDl4hMEqrRxVy7VB/PmQOqn3dzVNEvwaK8ANJjJ3wsICJJelraVvv0hRJGl
 VxzkMlyAl83PA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 00AA2A0088;
 Tue, 10 Dec 2019 22:46:50 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 10 Dec 2019 14:46:51 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 10 Dec 2019 14:46:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfgzQ+qIjj5yDoCmdTyU2xDtyx7imGEHFNXhsLbhk8/0M3MR75wHFUV9n8HSVQ7Ly4mJtmimSSOHYp8v8Zpf2T7YhuoHl5kfDYQrxr/xzOKC/09pETEKqEz09gM6TzA/TRqJAGQ6q5DLTFYGwJHdw5e8bTvJWrn0c+PbeW1fCXXU1yeVqp8g7zbzQz177hUZn1jQpS9kGiNxp7FzHvy0IzARTKSEc9W1nKeoiXUPpve2F4X/pEW15ejaZO1YzcRx7bbmbp1T/NNE7FORx9jYQ2HrGuQa3DakYFI0lH66diSqRLRxYZJuk6xGkcahwEiKyY/ppBJ9e//1DAmHlIVTFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLe/08CnUh1bBOnf5EhU9qcV4Y15JKfUA1Fg8UI4cE4=;
 b=Y9c3fKbIG2fYgQR/KaNGQMYf73mwh4Zp89QA7TIg6hx+ca5cAZizfu6QAr02FSshuBk8XGZVjdJbsMtX8w/aAEw0IVLeggUcn/DLdEX04dNH8lJeOD3jtmxQrn5+lNT1v60GkhwSdEkijj1dzoaGjMLXi1UcYjNFia2JRZBDnb25B+H/72Ibd8hOMsyQo9OOa8O/Ip6sOaO+1tDW9WxgKFdUwV1GjH0sZHQdJEMieVYxXu1ZG/UfQbI51ykZKVKYSQV/cnXQABrItyUF+/muITqrFYuVpBYUkH++hzMU6FXbkY8Itpmgl2p7km2M4dQJTlYTR6t4kIEHV1SYT5Wqfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLe/08CnUh1bBOnf5EhU9qcV4Y15JKfUA1Fg8UI4cE4=;
 b=HSWTIC3L+/8e1uAyqxnNK8LKVbzOJz6j8BwxcNsO6KZ85p0VFrh+AgMPWqyCcp5gbxMxAE2mF4avGVLTngm95PDnkkafvvCthx+M33UIHooijsQOdUc/GhzZALY6v72IQZ5J27MZAA9cZhM6NM/846QDbCVA+sHCJLJ8gcA3Kpg=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3254.namprd12.prod.outlook.com (20.179.93.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.16; Tue, 10 Dec 2019 22:46:48 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::19d8:78d:d881:c8ef]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::19d8:78d:d881:c8ef%5]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 22:46:48 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 "gcc-patches@gcc.gnu.org" <gcc-patches@gcc.gnu.org>
Subject: Re: [PATCH] PR 92846: [ARC] generate signaling FDCMPF for hard float
 comparisons
Thread-Topic: [PATCH] PR 92846: [ARC] generate signaling FDCMPF for hard float
 comparisons
Thread-Index: AQHVrsNTrzsWmijS+E6tvVh7KNVZ4KezFmMAgADjfoA=
Date: Tue, 10 Dec 2019 22:46:48 +0000
Message-ID: <c262dd40-9fe3-9e6f-3c1f-7fdbe56ffce1@synopsys.com>
References: <20191209190218.20544-1-vgupta@synopsys.com>
 <BYAPR12MB301302F82982712931B60172CA5B0@BYAPR12MB3013.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB301302F82982712931B60172CA5B0@BYAPR12MB3013.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [24.7.46.224]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 957b75a9-ec5b-4add-047a-08d77dc2d761
x-ms-traffictypediagnostic: BYAPR12MB3254:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3254AD85A69C7C36F85CEB9BB65B0@BYAPR12MB3254.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(376002)(346002)(39860400002)(396003)(189003)(199004)(13464003)(86362001)(6486002)(31686004)(31696002)(2906002)(186003)(478600001)(2616005)(26005)(4326008)(76116006)(316002)(8936002)(71200400001)(8676002)(66556008)(5660300002)(66446008)(66476007)(54906003)(81156014)(6506007)(64756008)(36756003)(53546011)(110136005)(6512007)(81166006)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3254;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9FenI6Nef+/j1owQNRoLmEMDZBEqpRvAYDPoG32wf0BWpLJzWVfla3zERh9qSGdB5sKGFPpu567X8T/wyL3pPeO2Y43gBUBQeDp6QSynkSLTZJbAju5bXgJ+iaPFt2UuH0J+G2fseBVG7Dxj+aFImjgHJH3epQIFanm93z572+ojUgxu7rHrjdlmr3+T8qObcsySv8f7jis+GMcTAXeSek4PwYnPB3lRyW/qilOzKsJz7d8YY7s2WsYNvfcPna/TR1fi6AYffbNg0MfCwLap7lm2lGVoe43/YRmQ8cBCJ3HZUAH0PwT+78HNx5as+FSTFw8wrGU8TcckMA8pFpDhtGe02QDeMXiTOsq6QNW5UG23ZHVXxO4oUY3zJFwRfc6Oa/a7D6IVn9Igqc9WQYT9+BrtgbB7lATodOcZAayBPtyjhmoqjcYJTWRLkqZx5Im0SdUpx6zKVljftoU5+XOhE98hrHHNSAT/wVsW6rhDWvLO5rv0bXH62n4Pirp8LxdT
Content-ID: <144A44161B7ADE49B26AACC586C5C92B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 957b75a9-ec5b-4add-047a-08d77dc2d761
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 22:46:48.6101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G+33XA+dUZlBDlVaYbzk8hvD/VIju9qU+2RPWogl6PPYLlxoitM35zt0k5lXJWe/PGAzPNhj52LwAFkveBjktw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3254
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_144655_155033_70BD45F2 
X-CRM114-Status: GOOD (  15.58  )
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
 "andrew.burgess@embecosm.com" <andrew.burgess@embecosm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 12/10/19 1:12 AM, Claudiu Zissulescu wrote:
> Hi,
>
> Thank you for your contribution, I'll push it asap. As far as I understand, you need this patch both in gcc9 branch and mainline.
>
> Cheers,
> Claudiu

Indeed both mainline and gcc9

Thx
-Vineet

>
>> -----Original Message-----
>> From: Vineet Gupta [mailto:vgupta@synopsys.com]
>> Sent: Monday, December 09, 2019 8:02 PM
>> To: gcc-patches@gcc.gnu.org
>> Cc: Claudiu Zissulescu <claziss@synopsys.com>;
>> andrew.burgess@embecosm.com; linux-snps-arc@lists.infradead.org;
>> Vineet Gupta <vgupta@synopsys.com>
>> Subject: [PATCH] PR 92846: [ARC] generate signaling FDCMPF for hard float
>> comparisons
>>
>> ARC gcc generates FDCMP instructions which raises Invalid operation for
>> signaling NaN only. This causes glibc iseqsig() primitives to fail (in
>> the current ongoing glibc port to ARC)
>>
>> So split up the hard float compares into two categories and for unordered
>> compares generate the FDCMPF instruction (vs. FDCMP) which raises
>> exception
>> for either NaNs.
>>
>> With this fix testsuite/gcc.dg/torture/pr52451.c passes for ARC.
>>
>> Also passes 6 additional tests in glibc testsuite (test*iseqsig) and no
>> regressions
>>
>> gcc/
>> xxxx-xx-xx  Vineet Gupta  <vgupta@synopsys.com>
>>
>> 	* config/arc/arc-modes.def (CC_FPUE): New Mode CC_FPUE which
>> 	helps codegen generate exceptions even for quiet NaN.
>> 	* config/arc/arc.c (arc_init_reg_tables): Handle New CC_FPUE mode.
>> 	(get_arc_condition_code): Likewise.
>> 	(arc_select_cc_mode): LT, LE, GT, GE to use the New CC_FPUE
>> mode.
>> 	* config/arc/arc.h (REVERSE_CONDITION): Handle New CC_FPUE
>> mode.
>> 	* config/arc/predicates.md (proper_comparison_operator):
>> Likewise.
>> 	* config/arc/fpu.md (cmpsf_fpu_trap): New Pattern for CC_FPUE.
>> 	(cmpdf_fpu_trap): Likewise.
>>
>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
>> ---
>>  gcc/config/arc/arc-modes.def |  1 +
>>  gcc/config/arc/arc.c         |  8 ++++++--
>>  gcc/config/arc/arc.h         |  2 +-
>>  gcc/config/arc/fpu.md        | 24 ++++++++++++++++++++++++
>>  gcc/config/arc/predicates.md |  1 +
>>  5 files changed, 33 insertions(+), 3 deletions(-)
>>
>> diff --git a/gcc/config/arc/arc-modes.def b/gcc/config/arc/arc-modes.def
>> index 36a2f4abfb25..d16b6a289a15 100644
>> --- a/gcc/config/arc/arc-modes.def
>> +++ b/gcc/config/arc/arc-modes.def
>> @@ -38,4 +38,5 @@ VECTOR_MODES (INT, 16);       /* V16QI V8HI V4SI V2DI
>> */
>>
>>  /* FPU condition flags.  */
>>  CC_MODE (CC_FPU);
>> +CC_MODE (CC_FPUE);
>>  CC_MODE (CC_FPU_UNEQ);
>> diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
>> index 28305f459dcd..cbb95d6e9043 100644
>> --- a/gcc/config/arc/arc.c
>> +++ b/gcc/config/arc/arc.c
>> @@ -1564,6 +1564,7 @@ get_arc_condition_code (rtx comparison)
>>  	default : gcc_unreachable ();
>>  	}
>>      case E_CC_FPUmode:
>> +    case E_CC_FPUEmode:
>>        switch (GET_CODE (comparison))
>>  	{
>>  	case EQ	       : return ARC_CC_EQ;
>> @@ -1686,11 +1687,13 @@ arc_select_cc_mode (enum rtx_code op, rtx x,
>> rtx y)
>>        case UNLE:
>>        case UNGT:
>>        case UNGE:
>> +	return CC_FPUmode;
>> +
>>        case LT:
>>        case LE:
>>        case GT:
>>        case GE:
>> -	return CC_FPUmode;
>> +	return CC_FPUEmode;
>>
>>        case LTGT:
>>        case UNEQ:
>> @@ -1844,7 +1847,7 @@ arc_init_reg_tables (void)
>>  	  if (i == (int) CCmode || i == (int) CC_ZNmode || i == (int) CC_Zmode
>>  	      || i == (int) CC_Cmode
>>  	      || i == CC_FP_GTmode || i == CC_FP_GEmode || i ==
>> CC_FP_ORDmode
>> -	      || i == CC_FPUmode || i == CC_FPU_UNEQmode)
>> +	      || i == CC_FPUmode || i == CC_FPUEmode || i ==
>> CC_FPU_UNEQmode)
>>  	    arc_mode_class[i] = 1 << (int) C_MODE;
>>  	  else
>>  	    arc_mode_class[i] = 0;
>> @@ -8401,6 +8404,7 @@ arc_reorg (void)
>>
>>  	  /* Avoid FPU instructions.  */
>>  	  if ((GET_MODE (XEXP (XEXP (pc_target, 0), 0)) == CC_FPUmode)
>> +	      || (GET_MODE (XEXP (XEXP (pc_target, 0), 0)) == CC_FPUEmode)
>>  	      || (GET_MODE (XEXP (XEXP (pc_target, 0), 0)) ==
>> CC_FPU_UNEQmode))
>>  	    continue;
>>
>> diff --git a/gcc/config/arc/arc.h b/gcc/config/arc/arc.h
>> index 4d7ac3281b41..c08ca3d0d432 100644
>> --- a/gcc/config/arc/arc.h
>> +++ b/gcc/config/arc/arc.h
>> @@ -1531,7 +1531,7 @@ enum arc_function_type {
>>    (((MODE) == CC_FP_GTmode || (MODE) == CC_FP_GEmode		 \
>>      || (MODE) == CC_FP_UNEQmode || (MODE) == CC_FP_ORDmode	 \
>>      || (MODE) == CC_FPXmode || (MODE) == CC_FPU_UNEQmode	 \
>> -    || (MODE) == CC_FPUmode)					 \
>> +    || (MODE) == CC_FPUmode || (MODE) == CC_FPUEmode)		 \
>>     ? reverse_condition_maybe_unordered ((CODE))			 \
>>     : reverse_condition ((CODE)))
>>
>> diff --git a/gcc/config/arc/fpu.md b/gcc/config/arc/fpu.md
>> index 6289e9c3f593..6729795de542 100644
>> --- a/gcc/config/arc/fpu.md
>> +++ b/gcc/config/arc/fpu.md
>> @@ -242,6 +242,18 @@
>>     (set_attr "type" "fpu")
>>     (set_attr "predicable" "yes")])
>>
>> +(define_insn "*cmpsf_fpu_trap"
>> +  [(set (reg:CC_FPUE CC_REG)
>> +	(compare:CC_FPUE (match_operand:SF 0 "register_operand"  "r,
>> r,r")
>> +			(match_operand:SF 1 "nonmemory_operand"
>> "r,CfZ,F")))]
>> +  "TARGET_FP_SP_BASE"
>> +  "fscmpf%?\\t%0,%1"
>> +  [(set_attr "length" "4,4,8")
>> +   (set_attr "iscompact" "false")
>> +   (set_attr "cond" "set")
>> +   (set_attr "type" "fpu")
>> +   (set_attr "predicable" "yes")])
>> +
>>  (define_insn "*cmpsf_fpu_uneq"
>>    [(set (reg:CC_FPU_UNEQ CC_REG)
>>  	(compare:CC_FPU_UNEQ
>> @@ -338,6 +350,18 @@
>>     (set_attr "type" "fpu")
>>     (set_attr "predicable" "yes")])
>>
>> +(define_insn "*cmpdf_fpu_trap"
>> +  [(set (reg:CC_FPUE CC_REG)
>> +	(compare:CC_FPUE (match_operand:DF 0 "even_register_operand"
>> "r")
>> +			(match_operand:DF 1 "even_register_operand"
>> "r")))]
>> +  "TARGET_FP_DP_BASE"
>> +  "fdcmpf%? %0, %1"
>> +  [(set_attr "length" "4")
>> +   (set_attr "iscompact" "false")
>> +   (set_attr "cond" "set")
>> +   (set_attr "type" "fpu")
>> +   (set_attr "predicable" "yes")])
>> +
>>  (define_insn "*cmpdf_fpu_uneq"
>>    [(set (reg:CC_FPU_UNEQ CC_REG)
>>  	(compare:CC_FPU_UNEQ
>> diff --git a/gcc/config/arc/predicates.md b/gcc/config/arc/predicates.md
>> index e0013b32f0f5..4d2ad7ba6789 100644
>> --- a/gcc/config/arc/predicates.md
>> +++ b/gcc/config/arc/predicates.md
>> @@ -439,6 +439,7 @@
>>  	      || code == ORDERED || code == UNORDERED);
>>
>>      case E_CC_FPUmode:
>> +    case E_CC_FPUEmode:
>>        return 1;
>>      case E_CC_FPU_UNEQmode:
>>        return 1;
>> --
>> 2.20.1

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
